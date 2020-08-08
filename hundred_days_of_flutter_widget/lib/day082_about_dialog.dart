import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day82AboutDialog extends StatefulWidget {
  Day82AboutDialog({Key key}) : super(key: key);

  @override
  _Day82AboutDialogState createState() => _Day82AboutDialogState();
}

class _Day82AboutDialogState extends State<Day82AboutDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("About"),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.info),
            ],
          ),
          onPressed: () {
            // ? What is AboutDialog....
            // ! AboutDialog is the place where we add the details of app....
            showAboutDialog(
              // ! here we called...
              context: context,
              applicationIcon: Image.asset(
                // ! App icons for view....
                'images/logo.png',
                width: 50,
                height: 50,
              ),
              applicationVersion: '0.1', // ! current version....
              applicationName: '100 Days of Flutter', // ! App name....
              applicationLegalese:
                  'This is the small initiative for learning widgets in a flutter in 100 days continuously.', // ! details of App....
            );
          },
        ),
      ),
      appBar: AppBar(
        title: Text('AboutDialog'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day082_about_dialog.dart';
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
