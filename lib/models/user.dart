import 'package:flutter/material.dart';
class Users {
  final String userID;
  String email;
  String userName;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;


  Users({@required this.userID, @required this.email});
  Map<String, dynamic> toMap(){
    return {
      'userID' : userID,
      'email' : email,
      'userName' : userName,
      'profilURL' : profilURL ?? '',
      'createdAt' : createdAt,
      'updatedAt' : updatedAt,
      'seviye' : seviye,
    };
  }
}