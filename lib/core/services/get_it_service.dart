import 'package:auvnet/core/services/firebase_auth_services.dart';
import 'package:auvnet/core/services/firestore_services.dart';
import 'package:auvnet/features/auth/data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton(FirebaseAuthServices());
  getIt.registerSingleton(FirestoreServices());
  getIt.registerSingleton(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      firestoreServices: getIt<FirestoreServices>(),
    ),
  );
}
