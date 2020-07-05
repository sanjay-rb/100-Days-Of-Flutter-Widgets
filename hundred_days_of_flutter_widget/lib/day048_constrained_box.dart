import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class Day48ConstrainedBox extends StatelessWidget {
  const Day48ConstrainedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day048_constrained_box.dart';
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
          /**
         * ? What is ConstrainedBox....
         * ! ConstrainedBox is the smart widget....
         * ! We can constrained the child with max - width&height, min - width&height....
         */
          child: ConstrainedBox(
        constraints: BoxConstraints
            .expand(), // ! we can use expand to fill all the parent space....
        // constraints: BoxConstraints(
        //   maxHeight: 250, ! fix max height....
        //   maxWidth: 250, ! fix max width....
        //   minHeight: 50, ! fix min height....
        //   minWidth: 50, ! fix min width....
        // ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Colors.deepOrange,
            onPressed: () {},
            child: Text("Click"),
          ),
        ),
      )),
    );
  }
}
