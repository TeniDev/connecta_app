part of './router.dart';

Widget _loginHandler(BuildContext context, GoRouterState state) {
  return const LoginPage();
}

Widget _registerHandler(BuildContext context, GoRouterState state) {
  return const RegisterPage();
}

Widget _homeHandler(BuildContext context, GoRouterState state) {
  return const HomePage();
}

Widget _createAddressRouteHandler(BuildContext context, GoRouterState state) {
  return const CreateAddressPage();
}

Widget _editAddressRouteHandler(BuildContext context, GoRouterState state) {
  return const EditAddressPage();
}

Widget _settingsHandler(BuildContext context, GoRouterState state) {
  return const SettingsPage();
}
