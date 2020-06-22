import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day35Spacer extends StatelessWidget {
  const Day35Spacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.red[200],
                ),
                Spacer(), // ? What is Spacer....
                /**
                 * ! Spacer is the simple filler between the Ui Widgets....
                 * ! we can give the [flex] value to fill between the spaces....
                 */
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.yellow[200],
                ),
                Spacer(
                  flex: 2,
                ),
                /**
                 * ! here we use the flex value as 2...
                 * ! so it will automatically take the ratio 1:2 space between the Conatiners....
                 */
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.green[200],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Spacer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day035_spacer.dart';
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
