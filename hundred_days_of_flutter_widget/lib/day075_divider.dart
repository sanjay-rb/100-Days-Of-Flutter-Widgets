import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day75Divider extends StatelessWidget {
  const Day75Divider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.red,
                child: Container(
                  width: 250,
                  height: 250,
                ),
              ),
            ),
            // ? What is Divider....
            /**
             * ! Name it self says that it is the simple line which can be added between the widgets....
             */
            Divider(), // normal divider....
            Divider(
              color: Colors.deepPurple, // added color....
            ),
            Divider(
              height: 50, // added even height on lines....
            ),
            Divider(
              thickness: 5, //  added the thickness of the line....
            ),
            Divider(
              indent: 25, // added the front indent....
            ),
            Divider(
              endIndent: 25, //  added end indent....
            ),

            // All together in Divider....
            Divider(
              color: Colors.red,
              thickness: 5,
              indent: 25,
              endIndent: 25,
              height: 100,
            ),
            Divider(
              color: Colors.green,
              thickness: 5,
              indent: 25,
              endIndent: 25,
              height: 100,
            ),
            Divider(
              color: Colors.blue,
              thickness: 5,
              indent: 25,
              endIndent: 25,
              height: 100,
            ),
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.red,
                child: Container(
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Divider'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day074_progress_indicator.dart';
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
