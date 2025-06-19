import 'package:auvnet/features/home/presentation/widgets/nav_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:auvnet/core/utils/app_assets.dart';
import 'package:auvnet/core/utils/app_colors.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  BottomNavigationBarItem _buildNavItem({
    required String asset,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            const NavBarIndicator()
          else
            const SizedBox(height: 0),

          const SizedBox(height: 4),

          Image.asset(asset, width: 24, height: 24),
        ],
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: AppTextStyles.medium12,
      unselectedLabelStyle: AppTextStyles.regular12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildNavItem(asset: Assets.imageHome, label: 'Home', index: 0),
        _buildNavItem(
          asset: Assets.imageCategory,
          label: 'Categories',
          index: 1,
        ),
        _buildNavItem(
          asset: Assets.imageIconParkOutlineDelivery,
          label: 'Delivery',
          index: 2,
        ),
        _buildNavItem(asset: Assets.imageCard, label: 'Cart', index: 3),
        _buildNavItem(asset: Assets.imageProfile, label: 'Profile', index: 4),
      ],
    );
  }
}
