import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day29SizedBox extends StatelessWidget {
  const Day29SizedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizedBox"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day029_sized_box.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: Center(
        child: SizedBox(
            // ? What is SizedBox....
            /**
             * ! Creates a fixed size box....
             * ! The [width] and [height] parameters can be null to indicate that the size of the box....
             * ! so that the chlid will set to the size of the box....
             */
            width: 250, // ? her we fix width to 250....
            height: 250, // ? her we fix height to 250....
            child: RaisedButton(
              // ! so that RaisedButton fixed to size 250x250....
              onPressed: () {},
              child: Text("Click Me...."),
            )),
      ),
    );
  }
}
