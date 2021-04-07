import 'package:annepedia/pages/home_page.dart';
import 'package:annepedia/pages/wellComePage.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context,listen: true);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return WellComePage();
      } else {
        return HomePage(user: _userModel.user);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
