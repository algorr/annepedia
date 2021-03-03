import 'dart:ui';
import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../locator.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  final AuthBase authService = locator<FirebaseAuthService>();
  final Users user;

  ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Image.asset('assets/icons/home.png', color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(
                            user: widget.user,
                          )));
                }),
            IconButton(
                icon: Image.asset(
                  'assets/icons/search.png',
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Image.asset(
                  'assets/icons/calendar.png',
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon:
                    Image.asset('assets/icons/female.png', color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/realcoli.jpg'),
                                fit: BoxFit.fitWidth)),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 110),
                    child: Card(
                      elevation: 20,
                      shape: CircleBorder(),
                      child: Center(
                        heightFactor: 1,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('assets/images/kayit.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.only(top: 200),
                      child: Center(
                        child: Text(
                          'userName',
                          style: TextStyle(fontSize: 15, fontFamily: 'Ubuntu'),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sorular',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            Text(
                              '23',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Takip',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            Text(
                              '1.3k',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Takipçi',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            Text(
                              '2.8k',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 20,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              'Gönderiler',
                              style:
                                  TextStyle(fontFamily: 'Ubuntu', fontSize: 12),
                            ),
                          ),
                          Divider(
                            height: 5,
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
