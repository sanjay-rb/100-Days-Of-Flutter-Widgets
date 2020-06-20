import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day33Flexible extends StatelessWidget {
  const Day33Flexible({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day033_flexible.dart';
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
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              children: <Widget>[
                Flexible(
                  // ? What is Flexible....
                  /**
                   * ! [flex] and [fit] are the two property given to the [Flexible]....
                   * ! [child] is the place where flex is going to be happens....
                   */
                  fit: FlexFit
                      .tight, // ? FlexFit.tight is equal to the Expanded....
                  // * The [Expanded] widget assigns this kind of [FlexFit] to its child....
                  flex: 1, // ! flex value determine the area of the child....
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Flexible(
                  // ?
                  flex: 1,
                  fit: FlexFit
                      .loose, // ? FlexFit.loose is equal to the width and height of the child....
                  // * The [Flexible] widget assigns this kind of [FlexFit] to its child....
                  child: Container(
                    height: 10,
                    color: Colors.purple,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
