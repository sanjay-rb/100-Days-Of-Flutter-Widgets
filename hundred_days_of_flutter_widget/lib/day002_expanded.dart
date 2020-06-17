import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day2Expanded extends StatelessWidget {
  const Day2Expanded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isExpanded =
        true; // ! change this to true to see the expanded funtionality....
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/lib/day002_expanded.dart';
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
        child: Container(
          child: isExpanded
              ? Column(
                  /**
                   * ! This Column use the Expanded Widget to share the children spaces in screen....
                   * ! Expanded uses the [flex] propertie to give the spacing level....
                   * ! play with [flex] to see the changes....
                   * ! initialy [flex] have 1....
                   * ! Creates a widget that expands a child of a Row,Column or Flex....
                   */
                  children: <Widget>[
                    Expanded(
                      flex: 10, // ? It will take 10% of screen
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 80, // ? It will take 80% of screen
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      flex: 10, // ? It will take 10% of screen
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                )
              : Column(
                  /**
                   * ! This Column don't use the Expanded Widget instead we used the MediaQuery to share the spaces....
                   * ! play with [height] to see the changes....
                   */
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *
                          0.30, // ? 30% of the screen
                      color: Colors.red,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *
                          0.30, // ? 30% of the screen
                      color: Colors.green,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *
                          0.30, // ? 30% of the screen
                      color: Colors.yellow,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
