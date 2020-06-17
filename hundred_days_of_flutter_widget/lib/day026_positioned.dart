import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day26Positioned extends StatelessWidget {
  const Day26Positioned({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 250;
    double height = 250;
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Positioned(
                // ? What is Positioned....
                top: height / 2,
                // ! [top] is the padding from the top....
                left: width / 2,
                // ! [left] is the padding from the left....
                right: 0,
                // ! [right] is the padding from the right....
                bottom: 0,
                // ! [bottom] is the padding from the bottom....
                child: Container(
                  color: Colors.amber,
                  child: Text("This is mid of top and left"),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: width / 2,
                bottom: height / 2,
                child: Container(
                  color: Colors.blue,
                  child: Text("This is start of top and left"),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Positioned"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day026_positioned.dart';
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
