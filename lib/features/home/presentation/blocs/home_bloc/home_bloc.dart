import 'package:bloc/bloc.dart';
import 'package:auvnet/features/home/domain/entities/service_entity.dart';
import 'package:auvnet/features/home/domain/usecases/fetch_services.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchServicesUseCase _fetchServicesUseCase;

  HomeBloc() 
    : _fetchServicesUseCase = FetchServicesUseCase(),
      super(HomeInitial()) {
    on<FetchServicesEvent>(_onFetchServices);
  }

  Future<void> _onFetchServices(FetchServicesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final services = await _fetchServicesUseCase.call();
      emit(HomeLoaded(services: services));
    } catch (_) {
      emit(const HomeError(message: 'Failed to load services'));
    }
  }
}