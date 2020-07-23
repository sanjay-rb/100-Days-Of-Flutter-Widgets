import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day66DefaultTabControllerAndTabBar extends StatefulWidget {
  Day66DefaultTabControllerAndTabBar({Key key}) : super(key: key);

  @override
  _Day66DefaultTabControllerAndTabBarState createState() =>
      _Day66DefaultTabControllerAndTabBarState();
}

class _Day66DefaultTabControllerAndTabBarState
    extends State<Day66DefaultTabControllerAndTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: null),
      appBar: AppBar(
        title: Text('Image'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day066_default_tab_controller_.dart';
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
