import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

part './router_handlers.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final routerProvider = Provider((ref) => _RouterConfig().router);

class _RouterConfig {
  _RouterConfig();

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesNames.homeRoute,
    routes: [
      GoRoute(
        path: RoutesNames.rootRoute,
        redirect: (context, state) => RoutesNames.homeRoute,
      ),
      GoRoute(
        path: RoutesNames.homeRoute,
        builder: _homeHandler,
      ),
      GoRoute(
        path: RoutesNames.loginRoute,
        builder: _loginHandler,
      ),
      GoRoute(
        path: RoutesNames.registerRoute,
        builder: _registerHandler,
      ),
    ],
  );
}
