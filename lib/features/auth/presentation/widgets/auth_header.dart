// lib/core/widgets/auth_header.dart
import 'package:flutter/material.dart';
import 'package:auvnet/core/utils/app_assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(Assets.imagesLogo, fit: BoxFit.contain)),
      ],
    );
  }
}
