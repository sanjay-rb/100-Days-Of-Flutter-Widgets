import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day40Placeholder extends StatelessWidget {
  const Day40Placeholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                /**
                   * ? What is Placeholder....
                   * ! Placeholder is the very simple widget for alocate the place for the upcomming widget....
                   * it have the fallbackHeight, fallbackWidth....
                   * to size the widget....
                   */
                child: Placeholder(
                  // ! here I am used the Placeholder....
                  fallbackHeight:
                      100, // ! The height to use when the placeholder is in a situation with an unbounded height.
                  fallbackWidth:
                      200, // ! The width to use when the placeholder is in a situation with an unbounded width.
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Placeholder"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day040_placeholder.dart';
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
