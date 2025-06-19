import 'package:auvnet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavBarIndicator extends StatelessWidget {
  const NavBarIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 6,
      decoration: const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
