import 'package:flutter/material.dart';

import 'views/create_address_views.dart';

class CreateAddressPage extends StatelessWidget {
  const CreateAddressPage({Key? key}) : super(key: key);

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
                return const SizedBox(
                  child: Center(
                    child: Text('Proximamente'),
                  ),
                );
              } else if (constraints.maxWidth >= 650) {
                return const SizedBox(
                  child: Center(
                    child: Text('Proximamente'),
                  ),
                );
              } else {
                return const CreateAddressMobileView();
              }
            },
          ),
        ),
      ),
    );
  }
}
