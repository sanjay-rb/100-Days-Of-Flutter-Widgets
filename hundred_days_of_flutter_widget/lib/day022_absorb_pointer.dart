import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day22AbsorbPointer extends StatelessWidget {
  const Day22AbsorbPointer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AbsorbPointer(
          /**
         * ? What is AbsorbPointer....
         * ! with the help of [AbsorbPointer] we can prevent the touch event from the user....
         */
          absorbing: true, // ! change here to activate the event....
          /**
         * ! When absorbing is true, this widget prevents its subtree from receiving pointer events by terminating hit testing at itself....
         * [absorbing] == true ? try to scroll the listview....
         */
          ignoringSemantics: false,
          /**
         * ! Whether the semantics of this render object is ignored when compiling the semantics tree....
         * ! if null takes the [absorbing] value....
         */
          child: ListView.builder(
            // ? here the ListView have scroll event....
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: RaisedButton(
                    // ? here the RaisedButton have click event....
                    child: Text("List item $index"),
                    onPressed: () {
                      print("List item $index");
                    }),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AbsorbPointer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day022_absorb_pointer.dart';
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
