import 'package:auvnet/core/functions/flutter_toast.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:auvnet/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:auvnet/features/auth/presentation/widgets/auth_header.dart';
import 'package:auvnet/features/auth/presentation/widgets/sign_up_view_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          flutterToast(msg: 'Sign up successful');
          Navigator.pop(context);
        }
        if (state is SignUpFailure) {
          flutterToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthHeader(),
                    const SignUpViewForm(),
                    const SizedBox(height: 13),
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity(
                          vertical: VisualDensity.minimumDensity,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Have an account',
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
