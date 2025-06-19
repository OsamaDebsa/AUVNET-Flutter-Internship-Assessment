import 'package:auvnet/features/auth/presentation/views/login_view.dart';
import 'package:auvnet/features/auth/presentation/views/sign_up_view.dart';
import 'package:auvnet/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:auvnet/features/home/presentation/views/home_layout.dart';
import 'package:auvnet/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:auvnet/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());

    case HomeLayout.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (_) => HomeBloc()..add(FetchServicesEvent()),
              child: const HomeLayout(),
            ),
      );
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
