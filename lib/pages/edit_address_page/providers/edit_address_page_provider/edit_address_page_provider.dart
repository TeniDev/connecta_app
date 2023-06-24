import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/utils.dart';
import '../../../../data/providers/providers.dart';
import '../../../../services/services.dart';
import '../edit_address_providers.dart';

part 'edit_address_page_provider.freezed.dart';
part 'edit_address_page_provider.g.dart';

final editAddressPageProvider =
    StateNotifierProvider<EditAddressPageEvents, EditAddressPageModel>((ref) => EditAddressPageEvents(ref));

@freezed
class EditAddressPageModel with _$EditAddressPageModel {
  const factory EditAddressPageModel({
    required bool isLoadingForm,
  }) = _EditAddressPageModel;

  factory EditAddressPageModel.fromJson(Map<String, dynamic> json) => _$EditAddressPageModelFromJson(json);
}

class EditAddressPageEvents extends StateNotifier<EditAddressPageModel> {
  EditAddressPageEvents(this.ref)
      : super(const EditAddressPageModel(
          isLoadingForm: false,
        ));

  final Ref ref;
  final formKeyCreateAddress = GlobalKey<FormState>();

  String? validateFields(String? value, BuildContext context) {
    if (value == null || value == '') {
      return 'Campo requerido';
    }
    return null;
  }

  void pop(BuildContext context) {
    context.pop();
    ref.read(addressToEditProvider.notifier).reset();
  }

  Future<void> editAddress(BuildContext context) async {
    try {
      state = state.copyWith(isLoadingForm: true);
      final result = await ref.read(addressService).editAddress(address: ref.read(addressToEditProvider)!);
      if (result) {
        if (context.mounted) {
          Toast.info(ref.read(localeProvider.notifier).translate(
                context,
                screen: 'toast_messages',
                key: 'address_updated',
              ));
        }
        state = state.copyWith(isLoadingForm: false);
        if (context.mounted) pop(context);
      } else {
        if (context.mounted) {
          Toast.error(ref.read(localeProvider.notifier).translate(
                context,
                screen: 'toast_messages',
                key: 'error_updating_address',
              ));
        }
      }
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }
}
