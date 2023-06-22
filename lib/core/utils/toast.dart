import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import 'utils.dart';

class Toast {
  static info(String message) {
    final snackBar = SnackBar(
      content: FadeInLeft(
        duration: const Duration(milliseconds: 350),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: AppColors.white),
            const SizedBox(width: 12),
            Text(
              message,
              style: AppStyles.medium,
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: AppColors.blue,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static error(String error) {
    final snackBar = SnackBar(
      content: FadeInLeft(
        duration: const Duration(milliseconds: 350),
        child: Row(
          children: [
            const Icon(Icons.cancel_outlined, color: AppColors.white),
            const SizedBox(width: 12),
            Text(
              error,
              style: AppStyles.medium,
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: AppColors.red,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
