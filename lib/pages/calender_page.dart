import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.account_circle_outlined),
        centerTitle: true,
        title: Text(
          "Takvim Sayfası",
          style: TextStyle(
              fontSize: 20, fontFamily: 'Ubuntu', color: Colors.white),
        ),
      ),
    );
  }
}
