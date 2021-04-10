import 'package:annepedia/models/user.dart';

abstract class AuthBase {
  Future<Users> currentUser();
  Future<Users> signInWithEmailAndPassword(String email, String password);
  Future<bool> signOut();
  Future<Users> createUserWithEmailandPassword(String email, String password, String userName);
}