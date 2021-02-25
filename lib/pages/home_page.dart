import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class HomePage extends StatefulWidget {

  final AuthBase authService = locator<FirebaseAuthService>();
  final Users user;

   HomePage({Key key,@required this.user,}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purple,
        color: Colors.white,
        animationCurve: Curves.easeOutCubic,
        height: 65,
        animationDuration: Duration(milliseconds: 600),
        items:<Widget> [
          Icon(Icons.home_rounded, size: 40, color: Colors.black,),
          Icon(Icons.question_answer_rounded,size: 40, color: Colors.black,),
          Icon(Icons.search_rounded,size: 40, color: Colors.black,),
          Icon(Icons.person_rounded,size: 40, color: Colors.black,),
        ],
        onTap: (index){},
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: cikisYap,
          child: Icon(
            Icons.logout,
            size: 26.0,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
        title: Text(
          'annepedia',
          style: TextStyle(fontFamily: 'Ubuntu'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            widget.authService.currentUser() == null
                ? Text(
                    'Hoşgeldin ',
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  )
                : Text(
                    'Hoşgeldin ${widget.user.userName}',
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  ),
          ],
        ),
      ),
    );
  }

  Future<bool> cikisYap() async {
  bool sonuc =  await widget.authService.signOut();

   return sonuc;
  }
}
