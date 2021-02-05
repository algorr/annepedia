import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sorular?",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Ubuntu',
                  color: Colors.purpleAccent),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size.width,
              height: 120,
              child: Card(
                elevation: 15,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.question_answer_outlined),
                      title: Text(
                        "Hangisisin?",
                        style: TextStyle(fontFamily: 'Ubuntu', fontSize: 18),
                      ),
                      subtitle: RadioListTile(value: ,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
