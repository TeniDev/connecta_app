import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final Function? onTapSuffixIcon;
  final bool suffixIconShow;
  final IconData? sufixIcon;
  final IconData? prefixIcon;
  final Function validator;
  final bool? obscureText;
  final bool enabled;
  final bool readOnly;
  final bool isInCenter;
  final TextStyle style;
  final Function? disableMessage;
  final Function(String)? onChange;
  final String? initialValue;
  final Function? onTap;

  const CustomInput({
    super.key,
    this.hint = '',
    this.suffixIconShow = false,
    this.sufixIcon,
    this.onTapSuffixIcon,
    this.prefixIcon,
    required this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.isInCenter = false,
    this.style = AppStyles.small,
    this.disableMessage,
    this.onChange,
    this.onTap,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => disableMessage != null ? disableMessage!() : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: TextFormField(
        initialValue: initialValue,
        validator: (value) => validator(value),
        readOnly: readOnly,
        onTap: readOnly ? () => onTap!() : null,
        onChanged: onChange,
        obscureText: obscureText!,
        enabled: enabled,
        textAlign: isInCenter ? TextAlign.center : TextAlign.start,
        style: style,
        cursorColor: AppColors.green,
        decoration: buildInputDecoration(
          hint: hint!,
          onTapSuffixIcon: onTapSuffixIcon,
          prefixIcon: prefixIcon,
          sufixIcon: sufixIcon,
          suffixIconShow: suffixIconShow,
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    Function? onTapSuffixIcon,
    IconData? sufixIcon,
    IconData? prefixIcon,
    bool? suffixIconShow = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0),
      filled: true,
      fillColor: enabled ? AppColors.grey : AppColors.grey.withOpacity(.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      hintText: hint,
      hintStyle: style,
      errorStyle: const TextStyle(color: Colors.white),
      suffixIcon: sufixIcon != null
          ? InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 20,
                  child: Icon(
                    sufixIcon,
                    color: AppColors.white,
                    size: 18,
                  ),
                ),
              ),
              onTap: () {
                onTapSuffixIcon!();
              },
            )
          : null,
      prefixIcon: prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 20,
                child: Icon(
                  prefixIcon,
                  color: AppColors.white,
                  size: 18,
                ),
              ),
            )
          : null,
    );
  }
}
