import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day77CupertinoActivityIndicator extends StatefulWidget {
  const Day77CupertinoActivityIndicator({Key key}) : super(key: key);

  @override
  _Day77CupertinoActivityIndicatorState createState() =>
      _Day77CupertinoActivityIndicatorState();
}

class _Day77CupertinoActivityIndicatorState
    extends State<Day77CupertinoActivityIndicator> {
  bool loader = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoActivityIndicator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day077_cupertino_activity_indicator.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoActivityIndicator(
              radius: 50,
              animating: loader,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  loader = !loader;
                });
              },
              child: Text(
                loader ? "Stop Loading" : "Start Loading",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
