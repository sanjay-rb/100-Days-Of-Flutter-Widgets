import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day38AspectRatio extends StatelessWidget {
  const Day38AspectRatio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              // ? What is AspectRatio....
              /**
               * ! AspectRatio is the easy way to maintain the width and height of the Widget perfectly....
               * ! this accept the [aspectRatio] as the property where we give the width and height ratio....
               * * like 3/4 - 3 times of width and 4 times of height....
               * * like 0.75 - is same as above....
               */
              child: AspectRatio(
                aspectRatio:
                    3 / 2, // ? here we give the 3 width and 2 height....
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AspectRatio(
                        aspectRatio:
                            1, // ? here we give 1 as value so it is equal to split up like 1/1, 2/2, 3/3, 4/, ....
                        child: Container(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AspectRatio"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day038_aspect_ratio.dart';
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
