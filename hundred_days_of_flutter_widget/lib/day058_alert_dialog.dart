import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day58AlertDialog extends StatefulWidget {
  Day58AlertDialog({Key key}) : super(key: key);

  @override
  _Day58AlertDialogState createState() => _Day58AlertDialogState();
}

class _Day58AlertDialogState extends State<Day58AlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                /**
                 * ? What is AlertDialog....
                 * ! AlertDialog is the Widget where we can display the pop up dialog for the user....
                 */
                showDialog(
                  // ! show dialog is the function which is used to trigger the dialog....
                  context: context,
                  builder: (context) => AlertDialog(
                    // ! AlertDialog is the normal android....
                    title: Text(
                        "This is Android AlertDialog"), // ! had title display heading....
                    content: Text(
                        "Click OK/Back"), // ! had content display message.....
                    actions: <Widget>[
                      // ! here we had the action button....
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(
                                context); // ! to pop out the Dialog....
                          },
                          child: Text("OK")),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Back"))
                    ],
                  ),
                );
              },
              child: Text("Android AlertDialog"),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    // ! CupertinoAlertDialog is the iPhone android....
                    title: Text("This is iPhone AlertDialog"),
                    content: Text("Click Ok/Back"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        // ! CupertinoDialogAction is for the action buttons....
                        child: Text("Ok"),
                        onPressed: () {
                          Navigator.pop(context); // ! to pop out the Dialog....
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Back"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text("iPhone AlertDialog"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("AlertDialog"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day058_alert_dialog.dart';
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
