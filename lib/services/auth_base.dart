import 'package:annepedia/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  Future<Users> currentUser();
  Future<Users> signInEmailPassword();
  Future<bool> signOut();

}