import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day16ClipRRect extends StatelessWidget {
  const Day16ClipRRect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          // ? What is ClipRRect....
          borderRadius: BorderRadius.circular(50.0),
          /**
         * ! we can simply make the [borderRadius] for any Rectangle Widgets....
         */
          clipBehavior: Clip.antiAlias,
          /**
         * ! we can specify the border look with the help of.... 
         * * antiAlias - This mode has anti-aliased clipping edges to achieve a smoother look.
         * * antiAliasWithSaveLayer - This mode not only clips with anti-aliasing, but also allocates an offscreen buffer.
         * * hardEdge - This mode enables clipping, but curves and non-axis-aligned straight lines will be jagged as no effort is made to anti-alias.
         */
          child: Container(
            // ! a simple container to text the working....
            color: Colors.orange,
            width: 250,
            height: 250,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("ClipRRect"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day016_cliprrect.dart';
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
