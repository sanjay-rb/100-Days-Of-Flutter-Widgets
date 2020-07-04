import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day47Semantics extends StatelessWidget {
  const Day47Semantics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semantics"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day047_semantics.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: SafeArea(
          child: Center(
        /**
             * ? What is Semantics....
             * ! Flutter's Semantics widget can annotate an app's UI with information about the meaning of other widgets.
             * ! It has almost fifty properties you can use to provide descriptions, metadata and more to screen readers and other semantic analysis-based tools.
             */
        child: Semantics(
          // ! here comes Semantics....
          child: Container(
            // ! and the child too....
            width: 200,
            height: 200,
            color: Colors.deepOrange,
            child: Center(
              child: Text(
                "View code to know detail about Semantics",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // ! after this we can specify the charater of the above container with more than 50 property...
          label:
              "This is simple container....", // * [lable] - very usefull and text descrpition porperty....
          button: false, // * is button....
          checked: false, // * is checked....
          container: true, // * is container....
          // ! and sooooooo.... nooooooo.....
          currentValueLength: 1,
          enabled: true,
          explicitChildNodes: false,
          focusable: false,
          focused: false,
        ),
      )),
    );
  }
}
