import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.bgColor = AppColors.blue,
    this.isLarge = false,
    this.isLoading = false,
  }) : super(key: key);

  final String label;
  final Function onPressed;
  final Color bgColor;
  final bool isLarge;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: isLoading
          ? const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: () => onPressed(),
              style: ElevatedButton.styleFrom(
                backgroundColor: bgColor,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: isLarge ? 100 : 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                label,
                style: AppStyles.buttons,
              ),
            ),
    );
  }
}
