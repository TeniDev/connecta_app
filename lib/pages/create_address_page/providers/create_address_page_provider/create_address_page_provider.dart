import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../../services/services.dart';

part 'create_address_page_provider.freezed.dart';
part 'create_address_page_provider.g.dart';

final createAddressPageProvider =
    StateNotifierProvider<CreateAddressPageEvents, CreateAddressPageModel>((ref) => CreateAddressPageEvents(ref));

@freezed
class CreateAddressPageModel with _$CreateAddressPageModel {
  const factory CreateAddressPageModel({
    required bool isLoadingForm,
  }) = _CreateAddressPageModel;

  factory CreateAddressPageModel.fromJson(Map<String, dynamic> json) => _$CreateAddressPageModelFromJson(json);
}

class CreateAddressPageEvents extends StateNotifier<CreateAddressPageModel> {
  CreateAddressPageEvents(this.ref)
      : super(const CreateAddressPageModel(
          isLoadingForm: false,
        ));

  final Ref ref;
  final formKeyCreateAddress = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final complementController = TextEditingController();
  final cityController = TextEditingController();
  final identifierNameController = TextEditingController();

  String? validateFields(String? value, BuildContext context) {
    if (value == null || value == '') {
      return 'Campo requerido';
    }
    return null;
  }

  void pop(BuildContext context) {
    context.pop();
    _cleanControllers();
  }

  void _cleanControllers() {
    addressController.text = '';
    complementController.text = '';
    cityController.text = '';
    identifierNameController.text = '';
  }

  Future<void> createAddress(BuildContext context) async {
    if (formKeyCreateAddress.currentState!.validate()) {
      state = state.copyWith(isLoadingForm: true);
      final result = await ref.read(addressService).saveAddress(
            address: AddressModel(
              id: '',
              address: addressController.text,
              complement: complementController.text,
              city: cityController.text,
              identifierName: identifierNameController.text,
            ),
          );
      Future.delayed(const Duration(milliseconds: 500));
      if (result.isEmpty) {
        if (context.mounted) {
          Toast.info(ref.read(localeProvider.notifier).translate(
                context,
                screen: 'toast_messages',
                key: 'address_created_successfully',
              ));
        }
        state = state.copyWith(isLoadingForm: false);
        if (context.mounted) pop(context);
      } else {
        state = state.copyWith(isLoadingForm: false);
        Toast.error(result);
      }
    }
  }
}
