import 'package:auvnet/features/auth/domain/entities/user_entity.dart';
import 'package:auvnet/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;
  SignUpBloc(this.authRepo) : super(SignUpInitial()) {
    on<SignUpSubmitEvent>((event, emit) async {
      await _signUp(event, emit);
    });
  }

  Future<void> _signUp(
    SignUpSubmitEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.register(
      email: event.mail,
      password: event.password,
      name: event.name,
    );

    result.fold(
      (user) => emit(SignUpSuccess(user: user)),
      (failure) => emit(SignUpFailure(errorMessage: failure.message)),
    );
  }
}
