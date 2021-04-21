

import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/database_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(Users user) async {
    await _firestore.collection("users").doc(user.userID).set(user.toMap());

    DocumentSnapshot _okunanUser = await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    Map _okunanUserBilgileriMap = _okunanUser.data();
    Users _okunanUserBilgileriNesne = Users.fromMap(_okunanUserBilgileriMap);
    print("okunan user nesnesi : "+ _okunanUserBilgileriNesne.toString());
    return true;
  }

  @override
  Future<Users> readUser(String userID) async {
    DocumentSnapshot _okunanUser = await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> _okunanUserInfosMap = _okunanUser.data();

    Users _okunanUserNesnesi = Users.fromMap(_okunanUserInfosMap);
    print("okunan user nesnesi : "+ _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }
}
