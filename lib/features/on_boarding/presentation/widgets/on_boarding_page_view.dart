import 'package:flutter/material.dart';
import 'on_boarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        OnBoardingPageViewItem(
          title: 'all-in-one delivery',
          subtitle:
              'Order groceries, medicines, and meals delivered straight to your door',
        ),
        OnBoardingPageViewItem(
          title: 'User-to-User Delivery',
          subtitle: 'Send or receive items from other users quickly and easily',
        ),
        OnBoardingPageViewItem(
          title: 'Sales & Discounts',
          subtitle: 'Discover exclusive sales and deals every day',
        ),
      ],
    );
  }
}
