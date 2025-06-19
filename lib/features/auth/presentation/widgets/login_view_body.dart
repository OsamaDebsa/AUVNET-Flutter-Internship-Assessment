import 'package:auvnet/core/functions/flutter_toast.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:auvnet/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:auvnet/features/auth/presentation/views/sign_up_view.dart';
import 'package:auvnet/features/auth/presentation/widgets/auth_header.dart';
import 'package:auvnet/features/auth/presentation/widgets/login_view_form.dart';
import 'package:auvnet/features/home/presentation/views/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          flutterToast(msg: 'Login successful');
          Navigator.pushReplacementNamed(context, HomeLayout.routeName);
        }
        if (state is LoginFailure) {
          flutterToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthHeader(),
                    const LoginViewForm(),
                    const SizedBox(height: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity(
                          vertical: VisualDensity.minimumDensity,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpView.routeName);
                      },
                      child: Text(
                        'Create an account',
                        style: AppTextStyles.bold14.copyWith(
                          color: const Color(0xff1877F2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
