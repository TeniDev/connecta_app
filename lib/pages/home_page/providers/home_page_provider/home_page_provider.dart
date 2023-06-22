import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../../services/services.dart';

part 'home_page_provider.freezed.dart';
part 'home_page_provider.g.dart';

final homePageProvider = StateNotifierProvider<HomePageEvents, HomePageModel>((ref) => HomePageEvents(ref));

@freezed
class HomePageModel with _$HomePageModel {
  const factory HomePageModel({
    required bool isLoadingSignOut,
  }) = _HomePageModel;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => _$HomePageModelFromJson(json);
}

class HomePageEvents extends StateNotifier<HomePageModel> {
  HomePageEvents(this.ref)
      : super(const HomePageModel(
          isLoadingSignOut: false,
        ));

  final Ref ref;

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

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserAddressStream() {
    return ref.read(databaseServiceProvider).getCollectionStream(
          collection:
              '${AppConstants.userCollection}/${ref.read(authServiceProvider).getCurrentUser()}/${AppConstants.addressCollection}',
        );
  }
}
