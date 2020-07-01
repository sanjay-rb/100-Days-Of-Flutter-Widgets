import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day44AnimatedPositioned extends StatefulWidget {
  Day44AnimatedPositioned({Key key}) : super(key: key);

  @override
  _Day44AnimatedPositionedState createState() =>
      _Day44AnimatedPositionedState();
}

class _Day44AnimatedPositionedState extends State<Day44AnimatedPositioned> {
  var _islong = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => setState(() {
            _islong = !_islong;
          }),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /**
                 * ? What is AnimatedPositioned....
                 * ! AnimatedPositioned is the cool animated widget by the flutter....
                 * ! where we can change the position of the elements in the stack dynamically....
                 * ! with cool animation.... 
                 */
                AnimatedPositioned(
                  width: 200, // ! here we fixed the width fixed...
                  height: _islong
                      ? 300
                      : 100, // ! here we set the height dynamically....
                  curve: Curves
                      .elasticOut, // ! here we give the animation curve....
                  onEnd: () => print(
                      "Animation Done"), // ! once the animation is finish this function will called....
                  child: Container(
                    // ! child carry the Animation object...
                    child: Center(
                      child: Text(
                        "Click",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    color: Colors.deepPurple,
                  ),
                  duration: Duration(seconds: 2),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AnimatedPositioned"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day044_animated_position.dart';
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
