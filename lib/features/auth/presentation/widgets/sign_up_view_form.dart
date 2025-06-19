import 'package:auvnet/core/functions/extract_user_name.dart';
import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:auvnet/core/widgets/custom_button.dart';
import 'package:auvnet/core/widgets/custom_password_field.dart';
import 'package:auvnet/core/widgets/custom_text_form_field.dart';
import 'package:auvnet/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewForm extends StatefulWidget {
  const SignUpViewForm({super.key});

  @override
  State<SignUpViewForm> createState() => _SignUpViewFormState();
}

class _SignUpViewFormState extends State<SignUpViewForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFormField(
              controller: _emailController,
              onSaved: (value) {
                _emailController.text = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              textInputType: TextInputType.emailAddress,
              text: 'mail',
              prefixIcon: Icons.mail_outline,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomPasswordField(controller: _passwordController),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomPasswordField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 18),
          CustomButton(
            text: 'Sign up',
            textStyle: AppTextStyles.medium14.copyWith(color: Colors.white),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Trigger the sign-up event
                context.read<SignUpBloc>().add(
                  SignUpSubmitEvent(
                    name: extractUserName(_emailController.text.trim()),
                    mail: _emailController.text.trim(),
                    password: _passwordController.text,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
