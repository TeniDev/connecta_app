import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../services/services.dart';

part 'login_page_provider.freezed.dart';
part 'login_page_provider.g.dart';

final loginPageProvider = StateNotifierProvider<LoginPageEvents, LoginPageModel>((ref) => LoginPageEvents(ref));

@freezed
class LoginPageModel with _$LoginPageModel {
  const factory LoginPageModel({
    required bool isObscurePassword,
    required bool isLoadingForm,
  }) = _LoginPageModel;

  factory LoginPageModel.fromJson(Map<String, dynamic> json) => _$LoginPageModelFromJson(json);
}

class LoginPageEvents extends StateNotifier<LoginPageModel> {
  LoginPageEvents(this.ref)
      : super(const LoginPageModel(
          isObscurePassword: true,
          isLoadingForm: false,
        ));

  final Ref ref;
  final formKeyLogin = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  void changeObscureInput() {
    state = state.copyWith(isObscurePassword: !state.isObscurePassword);
  }

  String? validateFields(String? value, BuildContext context) {
    if (value == null || value == '') {
      return 'Campo requerido';
    }
    return null;
  }

  void login(BuildContext context) async {
    if (formKeyLogin.currentState!.validate()) {
      state = state.copyWith(isLoadingForm: true);
      final result = await ref.read(authServiceProvider).logIn(
            email: userController.text,
            password: passwordController.text,
          );
      Future.delayed(const Duration(milliseconds: 500));
      if (result.isEmpty) {
        Toast.info('Bienvenido');
        state = state.copyWith(isLoadingForm: false);
        if (context.mounted) context.go(RoutesNames.homeRoute);
        userController.text = '';
        passwordController.text = '';
      } else {
        state = state.copyWith(isLoadingForm: false);
        Toast.error(result);
      }
    }
  }
}
