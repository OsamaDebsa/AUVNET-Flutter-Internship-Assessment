import 'package:auvnet/core/services/get_it_service.dart';
import 'package:auvnet/features/auth/data/repos/auth_repo_impl.dart';
import 'package:auvnet/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:auvnet/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'loginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(getIt<AuthRepoImpl>()),
        child: LoginViewBody(),
      ),
    );
  }
}
