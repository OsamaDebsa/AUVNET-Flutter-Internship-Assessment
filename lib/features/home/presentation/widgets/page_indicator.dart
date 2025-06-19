import 'package:flutter/material.dart';
import 'package:auvnet/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  final PageController controller;

  const PageIndicatorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: AppColors.primaryColor,
          dotColor: Colors.grey,
        ),
      ),
    );
  }
}
