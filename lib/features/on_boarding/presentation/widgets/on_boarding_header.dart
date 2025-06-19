import 'package:auvnet/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(Assets.imagesOnBoardingCircle),
          Positioned(top: 90, left: 20, child: Image.asset(Assets.imagesLogo)),
        ],
      ),
    );
  }
}
