import 'package:auvnet/features/home/data/repositories/home_repository.dart';
import 'package:auvnet/features/home/domain/entities/service_entity.dart';

class FetchServicesUseCase {
  final HomeRepository repository;

  FetchServicesUseCase() : repository = HomeRepositoryImpl();

  Future<List<ServiceEntity>> call() async {
    return repository.getServices();
  }
}
