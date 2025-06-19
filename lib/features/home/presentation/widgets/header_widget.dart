import 'package:auvnet/core/utils/app_assets.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.00, 0.05),
          end: Alignment(0.93, 1.10),
          colors: [const Color(0xFF8900FE), const Color(0xFFFFDE59)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text('Delivering to', style: AppTextStyles.medium12),
                Text('Al Satwa, 81A Street', style: AppTextStyles.bold16),
                Text(
                  'Hi hepa! ',
                  style: AppTextStyles.bold30.copyWith(color: Colors.white),
                ),
              ],
            ),
            Image.asset(Assets.imageGirlimage),
          ],
        ),
      ),
    );
  }
}
