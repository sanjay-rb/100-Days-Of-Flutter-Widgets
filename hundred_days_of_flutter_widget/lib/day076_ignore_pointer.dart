import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day76IgnorePointer extends StatelessWidget {
  const Day76IgnorePointer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ? What is IgnorePointer....
      /**
       * ! IgnorePointer is the cool widget for stop the user activity in the ui....
       */
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Can't Scroll the list because it is ignored by IgnorePointer",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: IgnorePointer(
              // ! simplely added IgnorePointer....
              ignoring: true, // ! and set the [ignoring] to true....
              child: ListView.builder(
                // ! so that this listview can't able to scroll....
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Item - $index"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('IgnorePointer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day076_ignore_pointer.dart';
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
