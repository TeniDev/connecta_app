import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../../services/services.dart';
import '../../../edit_address_page/providers/edit_address_providers.dart';

part 'home_page_provider.freezed.dart';
part 'home_page_provider.g.dart';

final homePageProvider = StateNotifierProvider<HomePageEvents, HomePageModel>((ref) => HomePageEvents(ref));

@freezed
class HomePageModel with _$HomePageModel {
  const factory HomePageModel({
    required bool isLoadingSignOut,
    required bool isSearching,
  }) = _HomePageModel;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => _$HomePageModelFromJson(json);
}

class HomePageEvents extends StateNotifier<HomePageModel> {
  HomePageEvents(this.ref)
      : super(const HomePageModel(
          isLoadingSignOut: false,
          isSearching: false,
        ));

  final Ref ref;
  final searchController = TextEditingController();

  Future<bool> getLoggedUser() async {
    try {
      final data = await ref.read(databaseServiceProvider).getDocument(
            documentId: ref.read(authProvider).currentUser!.uid,
            collection: AppConstants.userCollection,
          );
      if (data != null) {
        ref.read(userSessionProvider.notifier).setUser(UserModel.fromJson(data));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  bool get isLogged => ref.read(authServiceProvider).getCurrentUser() != null;

  Future<void> logout(BuildContext context) async {
    try {
      state = state.copyWith(isLoadingSignOut: true);
      if (context.mounted) context.go(RoutesNames.loginRoute);
      await ref.read(authServiceProvider).signOut();
      ref.read(userSessionProvider.notifier).removeUser();
      state = state.copyWith(isLoadingSignOut: false);
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  Stream<List<AddressModel>> getUserAddressStream() {
    return ref.read(addressService).getAllAddress(userId: ref.read(authProvider).currentUser!.uid);
  }

  Stream<List<AddressModel>> searchUserAddressStream() {
    return ref.read(addressService).getSearchAddress(
          userId: ref.read(authProvider).currentUser!.uid,
          searchText: searchController.text,
        );
  }

  void goToCreateAddress(BuildContext context) {
    context.push(RoutesNames.createAddressRoute);
  }

  void goToEditAddress({required BuildContext context, required AddressModel address}) {
    ref.read(addressToEditProvider.notifier).changeAddressToEdit(address);
    context.push(RoutesNames.editAddressRoute, extra: address);
  }

  Future<void> deleteAddress(BuildContext context, {required String addressId}) async {
    try {
      final result = await ref.read(addressService).deleteAddress(addressId: addressId);
      if (result) {
        if (context.mounted) {
          Toast.info(ref.read(localeProvider.notifier).translate(
                context,
                screen: 'toast_messages',
                key: 'address_deleted',
              ));
        }
      } else {
        if (context.mounted) {
          Toast.error(ref.read(localeProvider.notifier).translate(
                context,
                screen: 'toast_messages',
                key: 'error_deleting_address',
              ));
        }
      }
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  void searchAddress(String value) {
    searchController.text = value;
    if (value.isEmpty) {
      state = state.copyWith(isSearching: false);
      return;
    }
    state = state.copyWith(isSearching: true);
  }

  void clearSearch() {
    searchController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    state = state.copyWith(isSearching: false);
  }

  void goToSettings(BuildContext context) {
    context.push(RoutesNames.settingsRoute);
  }
}
