

import 'package:annepedia/Authentication/landing_page.dart';
import 'package:annepedia/Authentication/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Authentication/sign_in_page.dart';
import 'pages/home_page.dart';
import 'pages/questions.dart';
import 'pages/wellComePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'annepedia',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
