import 'package:auvnet/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.name, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
}
