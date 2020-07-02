import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day45AnimatedPadding extends StatefulWidget {
  Day45AnimatedPadding({Key key}) : super(key: key);

  @override
  _Day45AnimatedPaddingState createState() => _Day45AnimatedPaddingState();
}

class _Day45AnimatedPaddingState extends State<Day45AnimatedPadding> {
  bool _anim = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _anim = !_anim; // ! here i am toggle the bool value for changes....
          });
        },
        child: SafeArea(
          child: Center(
            /**
             * ? What is AnimatedPadding....
             * ! AnimatedPadding is the another cool animation widget for the Padding...
             * ! here we can change the size of the padding dynamiclly cool animation...
             */
            child: AnimatedPadding(
              // ! obviously it have the padding value to change dynamiclly....
              padding: EdgeInsets.all(_anim ? 125.0 : 0.0),
              // ! it is animated the it have duration too....
              duration: Duration(milliseconds: 2000),
              // ! we can give the curve to customize the animation effect...
              curve: Curves.elasticInOut,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.deepOrange,
                child: Center(
                    child: Text(
                  "Click",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AnimatedPadding"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day045_animated_padding.dart';
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
