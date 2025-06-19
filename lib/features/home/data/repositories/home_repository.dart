import 'package:auvnet/core/utils/app_assets.dart';
import 'package:auvnet/features/home/domain/entities/service_entity.dart';

abstract class HomeRepository {
  Future<List<ServiceEntity>> getServices();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<ServiceEntity>> getServices() async {
    return [
      ServiceEntity(
        name: 'Food',
        imageUrl: Assets.imagePerger,
        duration: '10 min',
      ),
      ServiceEntity(
        name: 'Health & Wellness',
        imageUrl: Assets.imageImage2,
        duration: '15 min',
      ),
      ServiceEntity(
        name: 'Groceries',
        imageUrl: Assets.imageImage3,
        duration: '20 min',
      ),
    ];
  }
}
