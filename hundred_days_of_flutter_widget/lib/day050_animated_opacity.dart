import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day50AnimatedOpacity extends StatefulWidget {
  Day50AnimatedOpacity({Key key}) : super(key: key);

  @override
  _Day50AnimatedOpacityState createState() => _Day50AnimatedOpacityState();
}

class _Day50AnimatedOpacityState extends State<Day50AnimatedOpacity> {
  var _animOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _animOpacity = !_animOpacity;
            });
          },
          child: Center(
            /**
             * ? What is AnimatedOpacity....
             * ! AnimatedOpacity is the very cool widget for perfrom animation on the opacity....
             */
            child: AnimatedOpacity(
              opacity: _animOpacity
                  ? 1.0
                  : 0.5, // ! we can change the opacity value dynamicly between 0.0 - 1.0....
              duration: Duration(
                  seconds:
                      1), // ! and we needed to pass the time duration for animation....
              child: Container(
                // ! child holds the element to be animated....
                width: 250,
                height: 250,
                color: Colors.deepOrange,
                child: Center(
                  child: Text(
                    "Click",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AnimatedOpacity"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day050_animated_opacity.dart';
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
