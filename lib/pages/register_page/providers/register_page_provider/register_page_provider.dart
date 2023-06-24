import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/providers/providers.dart';
import '../../../../services/services.dart';

part 'register_page_provider.freezed.dart';
part 'register_page_provider.g.dart';

final registerPageProvider =
    StateNotifierProvider<RegisterPageEvents, RegisterPageModel>((ref) => RegisterPageEvents(ref));

@freezed
class RegisterPageModel with _$RegisterPageModel {
  const factory RegisterPageModel({
    required bool isObscurePassword,
    required bool isLoadingForm,
    DateTime? birthday,
  }) = _RegisterPageModel;

  factory RegisterPageModel.fromJson(Map<String, dynamic> json) => _$RegisterPageModelFromJson(json);
}

class RegisterPageEvents extends StateNotifier<RegisterPageModel> {
  RegisterPageEvents(this.ref)
      : super(const RegisterPageModel(
          isObscurePassword: true,
          isLoadingForm: false,
          birthday: null,
        ));

  final Ref ref;
  final formKeyRegister = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void changeObscureInput() {
    state = state.copyWith(isObscurePassword: !state.isObscurePassword);
  }

  void changeBirthday(DateTime value) {
    state = state.copyWith(birthday: value);
  }

  String? validateFields(String? value, BuildContext context) {
    if (value == null || value == '') {
      return ref.read(localeProvider.notifier).translate(
            context,
            screen: 'toast_messages',
            key: 'require_field',
          );
    }
    return null;
  }

  void signup(BuildContext context) async {
    if (formKeyRegister.currentState!.validate()) {
      state = state.copyWith(isLoadingForm: true);
      final resultAuth = await ref.read(authServiceProvider).signUp(
            email: emailController.text,
            password: passwordController.text,
          );
      Future.delayed(const Duration(milliseconds: 500));
      if (resultAuth.isEmpty) {
        final resultData = await ref.read(databaseServiceProvider).saveDocument(
              documentId: ref.read(authServiceProvider).getCurrentUser(),
              data: {
                'id': ref.read(authServiceProvider).getCurrentUser(),
                'name': nameController.text,
                'lastName': lastNameController.text,
                'email': emailController.text,
                'birthday': state.birthday != null ? Timestamp.fromDate(state.birthday!) : null,
              },
              collection: AppConstants.userCollection,
            );
        if (resultData.isEmpty) {
          if (context.mounted) {
            Toast.info(ref.read(localeProvider.notifier).translate(
                  context,
                  screen: 'toast_messages',
                  key: 'welcome',
                ));
          }
          state = state.copyWith(isLoadingForm: false);
          if (context.mounted) context.go(RoutesNames.homeRoute);
          _cleanControllers();
        } else {
          state = state.copyWith(isLoadingForm: false);
          Toast.error(resultData);
        }
      } else {
        state = state.copyWith(isLoadingForm: false);
        Toast.error(resultAuth);
      }
    }
  }

  void pop(BuildContext context) {
    _cleanControllers();
    context.go(RoutesNames.loginRoute);
  }

  void _cleanControllers() {
    nameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    state = state.copyWith(birthday: null);
  }
}
