
import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/database_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBService implements DBBase{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(Users user) async{
   await _firestore.collection("users").doc(user.userID).set(user.toMap());
    return true;
  }

}