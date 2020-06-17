import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day4AnimationContainer extends StatefulWidget {
  Day4AnimationContainer({Key key}) : super(key: key);

  @override
  _Day4AnimationContainerState createState() => _Day4AnimationContainerState();
}

class _Day4AnimationContainerState extends State<Day4AnimationContainer> {
  var isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day004_animation_container.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isClick = !isClick;
            });
          },
          child: Center(
            child: AnimatedContainer(
              // ? what is AnimatedContainer....
              // ! The [curve] and [duration] arguments must not be null....

              duration: Duration(milliseconds: 500),
              /**
               * ! [duration] is the important and requried property for the AnimatedContainer....
               * ! here we give the time duration of the animation....
               */
              curve: Curves.elasticIn,
              /**
               * ! [curve] is the property where you can specify the animation effect.....
               * ! there are plenty of animations are there in the Curves....
               * ! such as - linear, decelerate, ease, bounce, elastic....
               */
              width: isClick ? 200.0 : 200.0,
              height: isClick ? 100.0 : 200.0,
              decoration: BoxDecoration(
                borderRadius: isClick
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(100),
                color: isClick ? Colors.red : Colors.green,
              ),
              child: isClick
                  ? Center(
                      child: Text(
                        "Off",
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        "On",
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
