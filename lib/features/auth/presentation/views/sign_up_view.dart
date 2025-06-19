import 'package:auvnet/core/services/get_it_service.dart';
import 'package:auvnet/features/auth/data/repos/auth_repo_impl.dart';
import 'package:auvnet/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:auvnet/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(getIt<AuthRepoImpl>()),
        child: SignUpViewBody(),
      ),
    );
  }
}
