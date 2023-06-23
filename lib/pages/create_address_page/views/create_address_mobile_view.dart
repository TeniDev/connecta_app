import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAddressMobileView extends ConsumerWidget {
  const CreateAddressMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text('Crear dirección'),
        ],
      ),
    );
  }
}
