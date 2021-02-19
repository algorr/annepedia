import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var user = FirebaseAuth.instance.currentUser;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
          onTap: cikisYap(),
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
            _auth.currentUser == null
                ? Text(
                    'Hoşgeldin ',
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  )
                : Text(
                    'Hoşgeldin ${FirebaseAuth.instance.currentUser.displayName}',
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  ),
          ],
        ),
      ),
    );
  }

  cikisYap() {
    if (_auth.currentUser != null) {
      _auth.signOut();
    } else {
      debugPrint("zaten kullanıcı yok");
    }
  }
}
