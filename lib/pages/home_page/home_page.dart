import 'package:flutter/material.dart';

import 'views/home_views.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                return Container(
                  color: Colors.red,
                );
              } else if (constraints.maxWidth >= 650) {
                return Container(
                  color: Colors.blue,
                );
              } else {
                return const HomeMobileView();
              }
            },
          ),
        ),
      ),
    );
  }
}
