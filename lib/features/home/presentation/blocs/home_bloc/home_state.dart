part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.services = const [], this.isLoading = false});

  final List<ServiceEntity> services;
  final bool isLoading;

  @override
  List<Object> get props => [services, isLoading];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(services: const [], isLoading: false);
}

class HomeLoading extends HomeState {
  const HomeLoading() : super(services: const [], isLoading: true);
}

class HomeLoaded extends HomeState {
  const HomeLoaded({required super.services}) : super(isLoading: false);
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message})
    : super(services: const [], isLoading: false);

  @override
  List<Object> get props => [message, services, isLoading];
}
