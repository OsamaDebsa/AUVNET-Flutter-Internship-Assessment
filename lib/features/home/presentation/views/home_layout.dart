import 'package:auvnet/features/home/presentation/views/cart_view.dart';
import 'package:auvnet/features/home/presentation/views/category_view.dart';
import 'package:auvnet/features/home/presentation/views/delivery_view.dart';
import 'package:auvnet/features/home/presentation/views/home_view.dart';
import 'package:auvnet/features/home/presentation/views/profile_view.dart';
import 'package:auvnet/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  static const String routeName = 'homeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeView(),
    CategoryView(),
    DeliveryView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
