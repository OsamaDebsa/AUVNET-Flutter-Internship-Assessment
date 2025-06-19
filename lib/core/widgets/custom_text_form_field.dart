import 'package:auvnet/core/functions/build_border.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.obscureText = false,
    this.textInputType,
    this.controller,
    this.validator,
    this.onSaved,
    this.suffixIcon,
  });
  final String text;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0x33C4C4C4),
        focusedBorder: builldBorder(),
        enabledBorder: builldBorder(),
        border: builldBorder(),
        hintText: text,
        hintStyle: AppTextStyles.light14.copyWith(
          color: Colors.black.withAlpha(128),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black.withAlpha((0.3 * 255).toInt()),
        ),
      ),
    );
  }
}
