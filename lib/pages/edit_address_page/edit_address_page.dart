import 'package:flutter/material.dart';

import 'views/edit_address_views.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({Key? key}) : super(key: key);

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
                return const EditAddressMobileView();
              }
            },
          ),
        ),
      ),
    );
  }
}
