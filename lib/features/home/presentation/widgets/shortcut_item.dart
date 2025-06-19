import 'package:auvnet/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ShortcutItem extends StatelessWidget {
  const ShortcutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: ShapeDecoration(
            color: const Color(0xFFFFEEE6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Image.asset(Assets.imageCoge),
        ),
        const Text('mos'),
      ],
    );
  }
}
