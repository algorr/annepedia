import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import 'package:annepedia/services/firestore_db_service.dart';
import '../locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<Users> currentUser() async {
    if (appMode == AppMode.RELEASE) {
      Users _user = await _firebaseAuthService.currentUser();
      return _user;
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signOut();
    }
    return null;
  }

  @override
  Future<Users> createUserWithEmailandPassword(
      String email, String password, String userName) async {
    if (appMode == AppMode.RELEASE) {
      Users _user = await _firebaseAuthService.createUserWithEmailandPassword(
          email, password, userName);
      bool _kayit = await _firestoreDBService.saveUser(_user);
      if (_kayit) {
        return _user;
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Future<Users> signInWithEmailAndPassword(
      String email, String password) async {
    if (appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signInWithEmailAndPassword(
          email, password);
    }
    throw UnimplementedError();
  }
}
