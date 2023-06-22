import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import '../../core/constants/constants.dart';
import '../../services/services.dart';

final localeProvider = NotifierProvider<_LocaleProvider, Locale>(() => _LocaleProvider());
final translateProvider = Provider.family<AppLocalizationService, BuildContext>(
  (ref, context) => AppLocalizationService.of(context),
);

class _LocaleProvider extends Notifier<Locale> {
  @override
  Locale build() {
    final sessionBox = Hive.box(LocalStorageConstants.sessionBox);
    final String defaultLocale = sessionBox.get(LocalStorageConstants.localeKey) ?? kIsWeb ? 'es' : Platform.localeName;
    return Locale(defaultLocale.split('_')[0]);
  }

  Locale? localeCallback(locale, supportedLocales) {
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale!.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  changeLocale(Locale locale) {
    state = SupportLocale.support.contains(locale) ? locale : const Locale('es');
  }
}
