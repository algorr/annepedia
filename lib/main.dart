import 'package:annepedia/locator.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'pages/wellComePage.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'annepedia',
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          home: WellComePage()),
    );
  }
}
