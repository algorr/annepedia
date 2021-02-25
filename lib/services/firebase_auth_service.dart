import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Users> currentUser() async {
    try {
      User user = _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      print('HATA CURRENT USER' + e.toString());
      return null;
    }
  }

  Users _userFromFirebase(User user) {
    if (user == null) return null;
    return Users(userID: user.uid, email: user.email);
  }


  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print('HATA SIGN OUT' + e.toString());
      return false;
    }
  }



  @override
  Future<Users> createUserWithEmailandPassword(String email, String password) {

    throw UnimplementedError();
  }

  @override
  Future<Users> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
