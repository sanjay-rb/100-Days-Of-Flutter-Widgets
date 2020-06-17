import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day21LayoutBuilder extends StatelessWidget {
  const Day21LayoutBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        // ? What is LayoutBuilder....
        builder: (BuildContext context, BoxConstraints constraints) {
          /**
         * ! [context], [constraints] are the two arugument passed by the LayoutBuilder....
         * ! context is the build context of the app....
         * ! constraints is the BoxConstraints which have the box width and height and some important property....
         */
          if (constraints.maxWidth > 600.0) {
            // ? check for the max width is greater than 600(a normal phone width)....
            return doubleBox(); // ! then change the ui by 2 Container Box....
          } else if (constraints.maxHeight < 350.0) {
            // ? check for the max with is lesser than 350.0(normal phone half height)....
            return multiBox(); // ! then change the ui to multi Container Box....
          } else {
            //  ? if it is normal phone in [Portrait] mode....
            return singleBox(); // ! then change the ui to the Single Container Box....
          }
        },
      ),
      appBar: AppBar(
        title: Text("LayoutBuilder"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day021_layout_builder.dart';
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

  Widget singleBox() {
    return Center(
      child: Container(
        // ! creating the single container with 300x300....
        height: 300.0,
        width: 300.0,
        color: Colors.red,
      ),
    );
  }

  Widget doubleBox() {
    // ! creating the double container with 300x300....
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 300.0,
            width: 300.0,
            color: Colors.red,
          ),
          Container(
            height: 300.0,
            width: 300.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget multiBox() {
    // ! creating the multi container with 90x90....
    double boxsize = 90;
    return Center(
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.blue,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.green,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.yellow,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.amber,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.purple,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.pink,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.black,
            width: boxsize,
            height: boxsize,
          ),
          Container(
            color: Colors.cyan,
            width: boxsize,
            height: boxsize,
          ),
        ],
      ),
    );
  }
}
