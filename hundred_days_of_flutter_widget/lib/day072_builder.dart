import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day72Builder extends StatefulWidget {
  Day72Builder({Key key}) : super(key: key);

  @override
  _Day72BuilderState createState() => _Day72BuilderState();
}

class _Day72BuilderState extends State<Day72Builder> {
  String _textOutput = "Click Both Button";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              _textOutput,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              child: Center(
                // ? what is the Builder....
                /**
                 * ! Builder is the widget where we get the very new [BuildContext context] for the use....
                 * ! We needed to use it in many case like calling provider, inherited widget, Scaffold, Theme, etc...,
                 */
                child: Builder(
                  // ! here comes the Builder....
                  builder: (BuildContext context) => RaisedButton(
                    // ! Which give ous the [builder] for get new [BuildContext]....
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Hi there, This is Sanjay R B."),
                        ),
                      );
                      setState(() {
                        _textOutput =
                            "Succesfully Called SnackBar by Current Scaffold";
                      });
                    },
                    child: Text("Using Builder"),
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    try {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Hi there, This is Sanjay R B."),
                        ),
                      );
                    } catch (e) {
                      setState(() {
                        _textOutput =
                            "Exception : Scaffold.of() called with a context that does not contain a Scaffold.";
                      });
                    }
                  },
                  child: Text("Without Using Builder"),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Builder'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day072_builder.dart';
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
