import 'package:flutter/material.dart';

import 'views/login_views.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1280) {
                //TODO: Desktop View
                return const SizedBox(
                  child: Center(
                    child: Text('Proximamente'),
                  ),
                );
              } else if (constraints.maxWidth >= 650) {
                //TODO: Tablet View
                return const SizedBox(
                  child: Center(
                    child: Text('Proximamente'),
                  ),
                );
              } else {
                return const LoginMobileView();
              }
            },
          ),
        ),
      ),
    );
  }
}
