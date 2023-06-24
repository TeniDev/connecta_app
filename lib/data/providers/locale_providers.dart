import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import '../../core/constants/constants.dart';
import '../../services/services.dart';

final localeProvider = NotifierProvider<_LocaleProvider, Locale>(() => _LocaleProvider());

class _LocaleProvider extends Notifier<Locale> {
  @override
  Locale build() {
    final sessionBox = Hive.box(LocalStorageConstants.sessionBox).get(LocalStorageConstants.localeKey);
    final String defaultLocale = sessionBox ?? (kIsWeb ? 'es' : Platform.localeName);
    return Locale(defaultLocale.split('_')[0]);
  }

  changeLocale(Locale locale) async {
    final sessionExpDate = Hive.box(LocalStorageConstants.sessionBox);
    await sessionExpDate.put(LocalStorageConstants.localeKey, locale.languageCode);
    state = SupportLocale.support.contains(locale) ? locale : const Locale('es');
  }

  String translate(BuildContext context, {required String screen, required String key}) {
    final localizationService = AppLocalizationService.of(context);
    return localizationService.translate(screen, key) ?? '';
  }
}
