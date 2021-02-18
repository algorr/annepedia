import 'package:annepedia/Authentication/registerPage.dart';
import 'package:annepedia/designs/slide_dot.dart';
import 'package:annepedia/models/model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../designs/slide_item.dart';

class WellComePage extends StatefulWidget {
  @override
  _WellComePageState createState() => _WellComePageState();
}

class _WellComePageState extends State<WellComePage> {
  int _currenPage = 0;
  final PageController _pageController = PageController(initialPage: 0);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currenPage < 6) {
        _currenPage++;
      } else {
        _currenPage = 6;
      }
      _pageController.animateToPage(_currenPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currenPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              SizedBox(
                height: 10,
              ),
              Text(
                'Anne ve adayların dünyasına hoşgeldin',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    color: Colors.purple.shade600),
              ),
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (context, index) => SlideItem(index),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currenPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: _currenPage < 5
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Getting Started',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'Ubuntu'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
