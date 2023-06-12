// TextformField Custom Widget
import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

Widget customTextFormField(
    {IconData? prefixIcon,
    required context,
    String? labelText,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? contentPadding,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    ValueChanged<String>? onFieldSubmitted,
    bool obscureText = false,
    TextEditingController? controller,
    bool isTablet = false,
    Widget? suffixIcon}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black54,
                size: tabletIs(context)
                    ? iconSizeTablet(context)
                    : iconSizeMobile(context),
              )
            : null,
        labelText: labelText,
        labelStyle: labelStyle != null
            ? labelStyle.copyWith(color: Colors.black)
            : const TextStyle(color: Colors.black),
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        hoverColor: customPrimarySwatch,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: customPrimarySwatch,
          ),
        ),
      ),
    ),
  );
}
