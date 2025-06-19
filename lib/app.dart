import 'package:flutter/material.dart';
import 'package:auvnet/core/routes/on_generate_route.dart';
import 'package:auvnet/core/utils/app_colors.dart';
import 'package:auvnet/features/splash/presentation/views/splash_view.dart';

class NawelApp extends StatelessWidget {
  const NawelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nawel',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
