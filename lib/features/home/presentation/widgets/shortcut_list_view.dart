import 'package:auvnet/features/home/presentation/widgets/shortcut_item.dart';
import 'package:flutter/material.dart';

class ShortcutListView extends StatelessWidget {
  const ShortcutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ShortcutItem(),
          );
        },
      ),
    );
  }
}