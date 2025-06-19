import 'package:auvnet/core/utils/app_text_styles.dart';
import 'package:auvnet/core/widgets/custom_button.dart';
import 'package:auvnet/core/widgets/custom_password_field.dart';
import 'package:auvnet/core/widgets/custom_text_form_field.dart';
import 'package:auvnet/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final emailPattern = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailPattern.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                _emailController.text = value!;
              },
              textInputType: TextInputType.emailAddress,
              text: 'mail',
              prefixIcon: Icons.mail_outline,
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomPasswordField(
              controller: _passwordController,
              onSaved: (value) {
                _passwordController.text = value!;
              },
            ),
          ),
          const SizedBox(height: 26),
          CustomButton(
            text: 'Log in',
            textStyle: AppTextStyles.medium14.copyWith(color: Colors.white),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<LoginBloc>().add(
                  LoginSubmitEvent(
                    email: _emailController.text.trim(),
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
