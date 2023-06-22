import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key, this.onPressed}) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.add,
          size: 32,
          color: AppColors.white,
        ),
      ),
    );
  }
}
