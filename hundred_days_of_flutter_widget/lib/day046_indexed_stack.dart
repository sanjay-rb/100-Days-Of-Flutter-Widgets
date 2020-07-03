import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day46IndexedStack extends StatefulWidget {
  Day46IndexedStack({Key key}) : super(key: key);

  @override
  _Day46IndexedStackState createState() => _Day46IndexedStackState();
}

class _Day46IndexedStackState extends State<Day46IndexedStack> {
  List colorsList = [
    Colors.red[800],
    Colors.green[800],
    Colors.yellow[800],
    Colors.blue[800],
    Colors.deepOrange[800],
    Colors.deepPurple[800],
  ];

  var _index = 0;

  inc() {
    // ! increment function....
    setState(() {
      if (_index < colorsList.length - 1) {
        _index++;
      }
    });
  }

  dec() {
    // ! decrement function....
    setState(() {
      if (_index > 0) {
        _index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexedStack"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day046_indexed_stack.dart';
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
          child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            /**
             * ? What is IndexedStack....
             * ! IndexedStack is the great widget for swap between multiple widgets....
             * ! it have all the property as Stack have in addtion [index]....
             */
            IndexedStack(
              index:
                  _index, // ! [index] is the property which decides the viewing element...
              sizing:
                  StackFit.expand, // ! [sizing] is same as [fit] of Stack....
              alignment: Alignment.center, // ! we can align the stack....
              children: <Widget>[
                for (Color color in colorsList)
                  Container(
                    width: 250,
                    height: 250,
                    color:
                        color, // ! here we pass the colors from list to the conainer....
                    child: Center(
                        child: Text(
                      _index
                          .toString(), // ! here we print the current index value....
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
              ],
            ),
            Positioned(
              bottom: 1,
              left: 1,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  color: Colors.white,
                  onPressed: () {
                    dec(); // ! here we decrement the [_index]....
                  }),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  color: Colors.white,
                  onPressed: () {
                    inc(); // ! here we increment the [_index]....
                  }),
            )
          ],
        ),
      )),
    );
  }
}
