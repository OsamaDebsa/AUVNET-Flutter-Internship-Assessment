import 'package:auvnet/features/auth/domain/entities/user_entity.dart';
import 'package:auvnet/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;
  LoginBloc(this.authRepo) : super(LoginInitial()) {
    on<LoginSubmitEvent>((event, emit) async {
      await _login(event, emit);
    });
  }
  Future<void> _login(LoginSubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await authRepo.login(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (user) => emit(LoginSuccess(user: user)),
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
    );
  }
}
