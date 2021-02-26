import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import '../locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<Users> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      Users _user = await _firebaseAuthService.currentUser();
      return _user;
    }
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
      String email, String password) async {
    return null;
  }

  @override
  Future<Users> signInEmailPassword() {
    // TODO: implement signInEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Users> signInWithEmailAndPassword(String email, String password) async{
    if(appMode == AppMode.RELEASE){
      return await _firebaseAuthService.signInWithEmailAndPassword(email, password);
    }
    throw UnimplementedError();
  }
}
