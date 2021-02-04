import 'file:///C:/Users/algor/AndroidStudioProjects/annepedia/lib/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'registerPage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _user =  FirebaseAuth.instance.currentUser;

  @override
  void initState()  {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {

    if(_user == null){
      return RegisterPage();
    }else {
      return HomePage(user: _user,);
    }
  }

  Future<void> _checkUser() async {
    await _user.updateProfile();

  }
}
