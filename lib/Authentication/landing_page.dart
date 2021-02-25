import 'package:annepedia/Authentication/sign_in_page.dart';
import 'package:annepedia/pages/home_page.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    if (_userModel.user == null) {
      return SignInPage();
    } else {
      return HomePage(
        user: _userModel.user,
      );
    }
  }
}
