import 'file:///C:/Users/algor/AndroidStudioProjects/annepedia/lib/models/model.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(slideList[index].imgUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                slideList[index].slogan,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 14,
                  color: Colors.purple.shade600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
