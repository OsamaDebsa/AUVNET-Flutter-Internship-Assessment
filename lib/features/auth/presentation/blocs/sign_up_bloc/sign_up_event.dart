part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SignUpSubmitEvent extends SignUpEvent {
  final String mail;
  final String password;
  final String name;

  SignUpSubmitEvent({
    required this.mail,
    required this.password,
    required this.name,
  });
}
