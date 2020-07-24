import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day67Drawer extends StatefulWidget {
  const Day67Drawer({Key key}) : super(key: key);

  @override
  _Day67DrawerState createState() => _Day67DrawerState();
}

class _Day67DrawerState extends State<Day67Drawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // ? What is Drawer....
    /**
     * ! Drawer is the most commom usage in the mobile phones....
     * ! A Fancy menu from left to right and right to left is called Drawer....
     */
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Drawer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day067_drawer.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          IconButton(
            // ! This IconButton is for endDrawer menu....
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState
                  .openEndDrawer(); // ! Here we added the [openEndDrawer] from the [scaffold.state]....
            },
          )
        ],
      ),
      drawer: Drawer(
        // ! to enalble Left to Right Drawer.....
        // ! we used the Drawer in the Scaffold is [drawer] property....
        // ! Scaffold is [drawer] property automatically add the menu button at the top of the screen....
        // ! and enable OnClick Event....
        elevation: 20,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'This is Left Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Left Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Left Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Left Settings'),
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Left Close'),
              onTap: () => Navigator.of(context)
                  .pop(), // ! here we use the [pop] from Navigator to back to the MainScreen....
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        // ! to enalble Right to Left Drawer.....
        // ! we used the Drawer in the Scaffold is [endDrawer] property....
        // ! Scaffold is [endDrawer] property is cool but we needed to add the Icon and Event....
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'This is Right Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Right Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Right Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Right Settings'),
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Right Close'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "This is Body",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
