import 'package:auvnet/core/utils/app_colors.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  });
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              textStyle ?? AppTextStyles.medium18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
