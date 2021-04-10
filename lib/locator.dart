import 'package:annepedia/repository/user_repository.dart';
import 'package:annepedia/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';
import 'services/firebase_auth_service.dart';

GetIt locator = GetIt.I;
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirestoreDBService());

}