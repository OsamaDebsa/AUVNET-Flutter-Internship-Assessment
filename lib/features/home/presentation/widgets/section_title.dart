import 'package:flutter/material.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.bold20);
  }
}
