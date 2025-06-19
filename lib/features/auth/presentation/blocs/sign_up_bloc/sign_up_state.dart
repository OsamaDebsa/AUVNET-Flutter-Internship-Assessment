part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity user;
  const SignUpSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

final class SignUpFailure extends SignUpState {
  final String errorMessage;
  const SignUpFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
