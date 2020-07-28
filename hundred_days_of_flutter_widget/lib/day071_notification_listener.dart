import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day71NotificationListener extends StatefulWidget {
  Day71NotificationListener({Key key}) : super(key: key);

  @override
  _Day71NotificationListenerState createState() =>
      _Day71NotificationListenerState();
}

class _Day71NotificationListenerState extends State<Day71NotificationListener> {
  String message = 'Please Scroll the list to Usage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              color: Colors.green,
              child: Center(
                child: Text(message),
              ),
            ),
            Expanded(
              // ? What is NotificationListener....
              /**
               * ! NotificationListener is the listener for the activity in the ui element....
               */
              child: NotificationListener<ScrollNotification>(
                // ! here i am used the scroll notification....
                onNotification: (ScrollNotification notification) {
                  print(
                      "$notification"); //! I just print the notification call back....
                  if (notification is ScrollStartNotification) {
                    // Check ScrollNotification is StartNotification....
                    setState(() {
                      message = "Scroll Start"; // ! print the Scroll Start....
                    });
                  } else if (notification is ScrollUpdateNotification) {
                    // Check ScrollNotification is UpdateNotification....

                    setState(() {
                      message =
                          "Scroll Update"; // ! print the Scroll Update....
                    });
                  } else if (notification is ScrollEndNotification) {
                    // Check ScrollNotification is EndNotification....
                    setState(() {
                      message = "Scroll End"; // ! print the Scroll End....
                    });
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("Index : $index"));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('NotificationListener'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day071_notification_listener.dart';
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
