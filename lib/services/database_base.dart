import 'package:annepedia/models/user.dart';

abstract class DBBase {
  Future<bool> saveUser(Users user);
}