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
    // ? What is DefaultTabController, TabBar & TabBarView....
    /**
     * ! To impelment the Tabs in the Flutter we need to maintain and understand the there important Widget....
     * * 1 - DefaultTabController to control the UiChange....
     * * 2 - TabBar to display the Tabs in [appBar]....
     * * 3 - TabBarView to display the current Page corresponding to Tabs....
     */
    return DefaultTabController(
      // ! here we added the [DefaultTabController]....
      length: 3, // ! [length] denote the total tabs....
      initialIndex: 1, // ! here we initialize the stating tab....
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              // ! here we added the [TabBar] at the bottom of the [appBar]....
              // ! and added the tabs one by one....
              Tab(
                child: Text("Left"),
              ),
              Tab(
                child: Text("Mid"),
              ),
              Tab(
                child: Text("Right"),
              ),
            ],
          ),
          title: Text('DefaultTabController, \nTabBar & TabBarView'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () async {
                const url =
                    'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                        'blob/master/hundred_days_of_flutter_widget/' +
                        'lib/day066_default_tab_controller_and_tab_bar.dart';
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
          child: TabBarView(
            // ! here we added the [TabBarView]....
            children: [
              // ! to the [children] of the TabBarView we added the actual tabs views....
              Center(
                child: Text(
                  "This is Left Side",
                  style: TextStyle(fontSize: 30, color: Colors.pink),
                ),
              ),
              Center(
                child: Text(
                  "This is Middle",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "This is Right Side",
                  style: TextStyle(fontSize: 30, color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
