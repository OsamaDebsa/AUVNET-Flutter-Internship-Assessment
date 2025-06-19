import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  final PageController pageController;

  const CustomPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/${index + 1}.png', // Replace with your image paths
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
