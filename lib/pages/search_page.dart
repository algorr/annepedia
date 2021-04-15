import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.question_answer_outlined),
        centerTitle: true,
        title: Text(
          "Sorular Sayfası",
          style: TextStyle(
              fontSize: 20, fontFamily: 'Ubuntu', color: Colors.white),
        ),
      ),
    );
  }
}
