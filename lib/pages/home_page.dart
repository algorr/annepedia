import 'package:annepedia/models/user.dart';
import 'package:annepedia/pages/profile_page.dart';
import 'package:annepedia/pages/wellComePage.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../locator.dart';

class HomePage extends StatefulWidget {
  final AuthBase authService = locator<FirebaseAuthService>();
  final Users user;

  HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEEEEE),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Image.asset('assets/icons/home.png', color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/icons/search.png', color: Colors.white,),
                onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/icons/calendar.png', color: Colors.white,),
                onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/icons/female.png', color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
                }),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          ),
          color: Color(0XFF675185),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: cikisYap,
          child: Icon(
            Icons.logout,
            color: Color(0XFF4A148C),
            size: 26.0,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  color: Color(0XFF4A148C),
                ),
              )),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'annepedia',
          style: TextStyle(fontFamily: 'Ubuntu', color: Color(0XFF4A148C)),
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
                    'Hoşgeldin Kullanıcı',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      color: Color(0XFF4A148C),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<bool> cikisYap() async {
    bool sonuc = await widget.authService.signOut();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WellComePage()));
    return sonuc;
  }
}
