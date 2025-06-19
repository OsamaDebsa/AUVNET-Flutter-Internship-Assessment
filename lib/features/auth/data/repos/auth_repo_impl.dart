import 'dart:developer';

import 'package:auvnet/core/errors/exceptions.dart';
import 'package:auvnet/core/errors/failures.dart';
import 'package:auvnet/core/services/firebase_auth_services.dart';
import 'package:auvnet/core/services/firestore_services.dart';
import 'package:auvnet/core/utils/app_constants.dart';
import 'package:auvnet/core/utils/end_points.dart';
import 'package:auvnet/features/auth/data/model/user_model.dart';
import 'package:auvnet/features/auth/domain/entities/user_entity.dart';
import 'package:auvnet/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServices _firebaseAuthServices;
  final FirestoreServices _firestoreServices;

  AuthRepoImpl({
    required FirestoreServices firestoreServices,
    required FirebaseAuthServices firebaseAuthServices,
  }) : _firebaseAuthServices = firebaseAuthServices,
       _firestoreServices = firestoreServices;
  @override
  Future<Either<UserEntity, ServerFailure>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = await _firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      try {
        await _firestoreServices.addData(
          path: EndPoints.userCollection,
          data: {'uid': user.uid, 'email': email, 'name': name},
        );
      } catch (e) {
        await user.delete();
        log('Error adding user data to Firestore: ${e.toString()}');
        throw CustomException(
          message: 'Failed to create user profile in Firestore',
        );
      }

      return left(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return right(ServerFailure(e.toString()));
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return right(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<UserEntity, ServerFailure>> login({
    required String email,
    required String password,
  }) async {
    try {
      User user = await _firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final token = await user.getIdToken();
      await Hive.box(AppConstants.authBox).put(AppConstants.token, token);

      return left(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return right(ServerFailure(e.toString()));
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return right(ServerFailure(e.toString()));
    }
  }
}
