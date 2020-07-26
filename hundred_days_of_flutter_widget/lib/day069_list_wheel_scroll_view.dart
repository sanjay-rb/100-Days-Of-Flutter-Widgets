import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day69ListWheelScrollView extends StatefulWidget {
  Day69ListWheelScrollView({Key key}) : super(key: key);

  @override
  _Day69ListWheelScrollViewState createState() =>
      _Day69ListWheelScrollViewState();
}

class _Day69ListWheelScrollViewState extends State<Day69ListWheelScrollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /**
         * ? What is ListWheelScrollView....
         * ! ListWheelScrollView is the Cool Widget with the ListView....
         * ! Yes it is Cylinder ListView....
         */
        child: ListWheelScrollView(
          itemExtent: 100, // ! item height as simple....
          diameterRatio: 2, // ! diameter of the cylinder....
          offAxisFraction: 0.5, // ! curve of the scroll....
          useMagnifier: true, // ! highlight the View....
          magnification: 1.5, // ! highlight rate if([useMagnifier] == true)....
          onSelectedItemChanged: (value) => print(
              "Current Tile : $value"), // ! return the current page index....
          overAndUnderCenterOpacity:
              0.5, // ! Opacity of the unselected View....
          children: [
            // ! [children] have the Collection of list items....
            Container(
              height: 100,
              color: Colors.red,
            ),
            Container(
              height: 100,
              color: Colors.green,
            ),
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              color: Colors.black,
            ),
            Container(
              height: 100,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              color: Colors.orange,
            ),
            Container(
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              height: 100,
              color: Colors.deepPurple,
            ),
            Container(
              height: 100,
              color: Colors.deepOrange,
            ),
            Container(
              height: 100,
              color: Colors.lime,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('ListWheelScrollView'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day069_list_wheel_scroll_view.dart';
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
