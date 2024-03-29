import 'package:flutter/material.dart';

class BooblePage extends StatefulWidget {
  @override
  _BooblePageState createState() => _BooblePageState();
}

enum Type { Type1, Type2, Type3, Type4 }

class _BooblePageState extends State<BooblePage> {
  Type myTape = Type.Type1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/main_top.png',
              width: 120,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: 120,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'anne',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 30,
                          color: Colors.purple),
                    ),
                    Text(
                      'pedia',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 30,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Sana daha iyi sonuçlar getirmem için aşağıdaki soruları cevaplayabilir misin?",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            color: Colors.deepPurple),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: size.width,
                      height: 200,
                      child: Card(
                        elevation: 15,
                        child: Column(
                          children: [
                            RadioListTile<Type>(
                                title: Text("Anne"),
                                value: Type.Type1,
                                groupValue: myTape,
                                onChanged: (Type type) {
                                  setState(() {
                                    myTape = type;
                                  });
                                }),
                            RadioListTile<Type>(
                                title: Text("Hamile"),
                                value: Type.Type2,
                                groupValue: myTape,
                                onChanged: (Type type) {
                                  setState(() {
                                    myTape = type;
                                  });
                                }),
                            RadioListTile<Type>(
                                title: Text("Anne olmak istiyorum"),
                                value: Type.Type3,
                                groupValue: myTape,
                                onChanged: (Type type) {
                                  setState(() {
                                    myTape = type;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Macera Başlasın',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'Ubuntu'),
                ),
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
