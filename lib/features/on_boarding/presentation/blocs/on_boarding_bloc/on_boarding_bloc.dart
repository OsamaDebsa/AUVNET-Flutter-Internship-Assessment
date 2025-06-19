import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_event.dart';
import 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(const OnBoardingState(currentPage: 0)) {
    on<OnNextPressed>((event, emit) {
      if (state.currentPage < 2) {
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    });

    on<OnSkipPressed>((event, emit) {
      emit(state.copyWith(currentPage: 2));
    });
  }
}
