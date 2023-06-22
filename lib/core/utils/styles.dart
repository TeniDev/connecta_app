import 'package:flutter/material.dart';

import 'utils.dart';

class AppStyles {
  static const TextStyle small = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );
  static const TextStyle medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const TextStyle large = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static const TextStyle titleLarge = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static const TextStyle buttons = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static const TextStyle link = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationColor: AppColors.white,
  );
}
