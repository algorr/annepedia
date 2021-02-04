import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var user = FirebaseAuth.instance.currentUser;

  HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Text('Çıkış'),
      ],
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
        title: Text(
          'Ana Sayfa',
          style: TextStyle(fontFamily: 'Ubuntu'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Hoşgeldin ${FirebaseAuth.instance.currentUser.displayName}',
              style: TextStyle(fontFamily: 'Ubuntu'),
            ),

          ],
        ),
      ),
    );
  }
}
