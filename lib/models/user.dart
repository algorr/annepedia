import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Users {
  final String userID;
  String email;
  String userName;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;


  Users({@required this.userID, @required this.email, @required this.userName});

  Map<String, dynamic> toMap(){
    return {
      'userID' : userID,
      'email' : email,
      'userName' : userName ?? email.substring(0, email.indexOf('@')),
      'profilURL' : profilURL ?? '',
      'createdAt' : createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt' : updatedAt ?? FieldValue.serverTimestamp(),
      'seviye' : seviye ?? 1,
    };
  }

  Users.fromMap(Map<String, dynamic> map)
    : userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        profilURL = map['profilURL'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate(),
        seviye = map['seviye'];

  @override
  String toString() {
    return 'Users{userID: $userID, email: $email, userName: $userName, profilURL: $profilURL, createdAt: $createdAt, updatedAt: $updatedAt, seviye: $seviye}';
  }
}