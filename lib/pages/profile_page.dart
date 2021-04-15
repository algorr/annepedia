import 'dart:ui';
import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locator.dart';
import 'home_page.dart';
import 'wellComePage.dart';

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
      body: SingleChildScrollView(
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/realcoli.jpg'),
                              fit: BoxFit.fitWidth)),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                  icon: Image.asset('assets/icons/logout.png'),
                                  onPressed: () => cikisYap()),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 280),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                  icon:
                                      Image.asset('assets/icons/settings.png'),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 110),
                  child: Card(
                    elevation: 20,
                    shape: CircleBorder(),
                    child: Stack(
                      children: [
                        Center(
                          heightFactor: 1,
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_a_photo_rounded,
                                size: 30,
                              ),
                            ),
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/images/kayit.jpg'),
                          ),
                        ),
                        Positioned(
                          left: 325,
                          top: 80,
                          child: Column(
                            children: [
                              Icon(
                                Icons.star_half_rounded,
                                size: 21,
                                color: Colors.amber,
                              ),
                              Text(
                                'Rank',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(top: 200),
                  child: Center(
                    child: Text(
                      'userName',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Ubuntu',
                        color: Color(0XFF675185),
                      ),
                    ),
                  ),
                ),
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
                              color: Color(0XFF675185),
                            ),
                          ),
                          Text(
                            '23',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              color: Color(0XFF675185),
                            ),
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
                              color: Color(0XFF675185),
                            ),
                          ),
                          Text(
                            '1.3k',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              color: Color(0XFF675185),
                            ),
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
                              color: Color(0XFF675185),
                            ),
                          ),
                          Text(
                            '2.8k',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              color: Color(0XFF675185),
                            ),
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
    );
  }

  Future<bool> cikisYap() async {
    bool sonuc = await widget.authService.signOut();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WellComePage()));
    return sonuc;
  }
}
