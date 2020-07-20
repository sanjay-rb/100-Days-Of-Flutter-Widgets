import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day63CupertinoActionSheet extends StatefulWidget {
  const Day63CupertinoActionSheet({Key key}) : super(key: key);

  @override
  _Day63CupertinoActionSheetState createState() =>
      _Day63CupertinoActionSheetState();
}

class _Day63CupertinoActionSheetState extends State<Day63CupertinoActionSheet> {
  String _selectedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _selectedText,
            style: TextStyle(fontSize: 30, color: Colors.pink),
          ),
          RaisedButton(
            child: Text("Click Here!"),
            onPressed: () {
              /**
               * ? What is the CupertinoActionSheet....
               * ! CupertinoActionSheet is the bottom sheet for the iOS custom style....
               */
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: Text(
                      "This is Child List"), // ! this is have the [title] for the Head....
                  message: Text(
                      "Please select the name"), // ! this is have the [message] for the SubHead....
                  actions: <Widget>[
                    // ! [actions] is the list which holds the list of CupertinoActionSheetAction....
                    CupertinoActionSheetAction(
                      child:
                          Text("Sanjay"), // ! Here we create the listView....
                      onPressed: () {
                        // ! Here we create the event callback....
                        Navigator.pop(context);
                        setState(() {
                          _selectedText = "Sanjay";
                        });
                      },
                    ),
                    CupertinoActionSheetAction(
                      isDefaultAction:
                          true, // ! to make tha list [DefaultAction] and highlight....
                      child: Text("Shari"),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedText = "Shari";
                        });
                      },
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction:
                          true, // ! to make tha list [DestructiveAction] and highlight....
                      child: Text("SriShanth"),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedText = "SriShanth";
                        });
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Humsi"),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedText = "Humsi";
                        });
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Niki"),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedText = "Niki";
                        });
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    // ! here we can add the cancel funtionalty in [cancelButton] which is take the [CupertinoActionSheetAction]....
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedText = "";
                      });
                    },
                    child: Text("Cancel"),
                  ),
                ),
              );
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: Text('CupertinoActionSheet'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day063_cupertino_action_sheet.dart';
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
