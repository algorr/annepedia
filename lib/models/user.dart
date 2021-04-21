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
}