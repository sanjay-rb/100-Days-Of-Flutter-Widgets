import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day1SafeArea extends StatelessWidget {
  const Day1SafeArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SafeArea"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day001_safearea.dart';
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
        // ? What is SafeArea?....
        /**
         * ! here the is SafeArea....
         * ! Creates a widget that avoids operating system interfaces....
         * ! Warp all the child in between the notifactionbar and the bottom navigation bar....
         */
        top: true,
        bottom: true,
        left: true,
        right: true,
        /**
         * ! we can give specific side as safe....
         * ! initially all are true....
         */

        maintainBottomViewPadding: true,
        /**
         * ! if there is an onscreen keyboard displayed above the SafeArea,....
         * ! the padding can be maintained below the obstruction rather than being consumed....
         * ! initially have false value....
         */
        minimum: EdgeInsets.all(50),
        /**
         * ! to fix the custom padding....
         * ! initially match to MediaQuery....
         */
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
