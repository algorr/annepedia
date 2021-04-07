import 'package:annepedia/models/user.dart';
import 'package:annepedia/pages/profile_page.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locator.dart';

class HomePage extends StatefulWidget {

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
    final _userModel = Provider.of<UserModel>(context,listen: true);
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
                icon: Image.asset(
                  'assets/icons/search.png',
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Image.asset(
                  'assets/icons/question.png',
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
      appBar: AppBar(
        elevation: 0,
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
            _userModel.currentUser() != null
                ? Text(
                    'Hoşgeldin ${_userModel.user.userID}',
                    style: TextStyle(fontFamily: 'Ubuntu'),
                  )
                : Text(
                    "Kullanıcı ",
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
}
