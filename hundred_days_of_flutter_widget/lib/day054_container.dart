import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day54Container extends StatelessWidget {
  const Day54Container({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // ! Container is the very important and most using widget in the flutter app development....
          child: Container(
            width:
                250, // ! we can give the fixed [width] here and it is supressed because it fixed in [constraints]....
            height:
                250, // ! we can give the fixed [height] here and it is supressed because it fixed in [constraints]....
            //color: Colors.deepOrange, // ! here the [color] is surpressed because we fixed it in [decoration]
            alignment: Alignment.center, // ! we can [align] the child....
            margin: EdgeInsets.all(20), // ! define the [margin] for parent....
            padding:
                EdgeInsets.all(50), //  ! define the [padding] for child....
            clipBehavior: Clip.none, // ! we can give the [clip] behavior....
            constraints: BoxConstraints.loose(Size(300,
                300)), // ! we can [constrains] the size by loose, tight, expand, tightForFinite, tightFor....
            decoration: BoxDecoration(
                // ! we can constomize the container by [decoration] here....
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(50)),
            transform: Matrix4.identity()
              ..rotateZ(pi /
                  8), // ! and also we freely move around the space by [tranform]
            child: Text(
                "This is inside the Container...."), // ! [child] hold the inside widget....
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Container"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day054_container.dart';
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
