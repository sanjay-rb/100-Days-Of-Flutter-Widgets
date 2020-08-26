import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day23Transform extends StatefulWidget {
  Day23Transform({Key key}) : super(key: key);

  @override
  _Day23TransformState createState() => _Day23TransformState();
}

class _Day23TransformState extends State<Day23Transform> {
  double point;
  Color _color;

  @override
  void initState() {
    point = 0.0;
    _color = Colors.green;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform(
            // ? What is Transform....
            origin: Offset(50, 50),
            /**
           * ! [origin] is the property to set the point where the transformation to be perform....
           * ! in my case I have seted to center of the container....
           */
            child: Container(
              width: 100,
              height: 100,
              color: _color,
            ),
            /**
           * ! [child] is the property where the real fixed element is present....
           * ! I have the Container with 100x100 of green color....
           */
            transform: Matrix4.skew(
                point, point) // ? we are going to change the X and Y values....
              ..translate(point *
                  100) // ? we can change the entire box with [translate]....
              ..rotateY(point) // ? we can [rotate] the along tha Y axis....
              ..scale(point +
                  1), // ? we can also zoom in and out the box by [scale]....
          ),
          /**
         * ! [transform] here comes the core....
         * ! [transform] is the place where we are going to perfrom skew, translate, rotate, scale....
         */
          Slider(
            min: 0.0,
            max: pi,
            activeColor: Colors.black,
            inactiveColor: Colors.blue,
            value: point,
            onChanged: (change) {
              setState(() {
                print(change);
                if (change < pi / 2) {
                  _color = Colors.green;
                } else {
                  _color = Colors.red;
                }
                point = change;
              });
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text("Transform"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day023_transform.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
    );
  }
}
