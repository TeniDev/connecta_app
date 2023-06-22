import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/config.dart';
import 'core/constants/constants.dart';
import 'core/router/router.dart';
import 'core/utils/utils.dart';
import 'data/providers/providers.dart';
import 'services/services.dart';

class ConnectaApp extends ConsumerWidget {
  const ConnectaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppConstants.appFont,
        scaffoldBackgroundColor: AppColors.black,
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: SupportLocale.support,
      scrollBehavior: AppScrollBehavior(),
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
