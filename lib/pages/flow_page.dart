import 'package:annepedia/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowPage extends StatefulWidget {
  @override
  _FlowPageState createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.wifi_tethering), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
          }),
        ],
        elevation: 120,
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.logout),
        centerTitle: true,
        title: Text(
          "Akış Sayfası",
          style: TextStyle(
              fontSize: 20, fontFamily: 'Ubuntu', color: Colors.white),
        ),
      ),
      body: Center(
        child: Text("FlowPage Sayfası"),
      ),
    );
  }
}
