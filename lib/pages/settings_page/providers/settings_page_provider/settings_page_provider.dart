import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/providers/providers.dart';
import '../../../../services/services.dart';

part 'settings_page_provider.freezed.dart';
part 'settings_page_provider.g.dart';

final settingsPageProvider =
    StateNotifierProvider<SettingsPageEvents, SettingsPageModel>((ref) => SettingsPageEvents(ref));

@freezed
class SettingsPageModel with _$SettingsPageModel {
  const factory SettingsPageModel({
    required bool isLoadingSignOut,
  }) = _SettingsPageModel;

  factory SettingsPageModel.fromJson(Map<String, dynamic> json) => _$SettingsPageModelFromJson(json);
}

class SettingsPageEvents extends StateNotifier<SettingsPageModel> {
  SettingsPageEvents(this.ref)
      : super(const SettingsPageModel(
          isLoadingSignOut: false,
        ));

  final Ref ref;

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

  void pop(BuildContext context) {
    context.pop();
  }

  void changeLanguage(Locale newLocale) {
    ref.read(localeProvider.notifier).changeLocale(newLocale);
  }
}
