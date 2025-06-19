import 'package:auvnet/core/errors/failures.dart';
import 'package:auvnet/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<UserEntity, ServerFailure>> register({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<UserEntity, ServerFailure>> login({
    required String email,
    required String password,
  });
}
