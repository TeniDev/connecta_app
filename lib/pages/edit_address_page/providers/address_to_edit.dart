import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';

final addressToEditProvider = NotifierProvider<EditedAddress, AddressModel?>(() {
  return EditedAddress();
});

class EditedAddress extends Notifier<AddressModel?> {
  @override
  AddressModel? build() {
    return null;
  }

  void changeAddressToEdit(AddressModel? value) {
    state = value;
  }

  void changeAddress(String? value) {
    state = state!.copyWith(address: value!);
  }

  void changeComplement(String? value) {
    state = state!.copyWith(complement: value);
  }

  void changeCity(String? value) {
    state = state!.copyWith(city: value!);
  }

  void changeIdentifierName(String? value) {
    state = state!.copyWith(identifierName: value);
  }

  void reset() {
    state = null;
  }
}
