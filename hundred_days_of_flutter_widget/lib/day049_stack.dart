import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day49Stack extends StatelessWidget {
  const Day49Stack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /**
         * ? What is Stack....
         * ! Stack is the very important widget....
         * ! With the help of Stack, Tranform, AnimationBuilder we can perform awesome....
         */
        child: Stack(
          fit: StackFit
              .loose, // ! we can give loose(default), expand(fill), passthrough(overlap)....
          alignment: Alignment
              .center, // ! we can give all the alignment here - to modify the root alignment of the child....
          overflow: Overflow.visible, // ! we can give clip, visible....
          children: <Widget>[
            // ! here we add the list of child widgets....
            Container(
              width: 250,
              height: 250,
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.black,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Stack"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day049_stack.dart';
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
