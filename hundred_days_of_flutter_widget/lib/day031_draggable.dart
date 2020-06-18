import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day31Draggable extends StatefulWidget {
  Day31Draggable({Key key}) : super(key: key);

  @override
  _Day31DraggableState createState() => _Day31DraggableState();
}

class _Day31DraggableState extends State<Day31Draggable> {
  String acceptData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day031_draggable.dart';
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
          builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight / 2,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Draggable<String>(
                        // ? What is Draggable....
                        /**
                         * ! requried properties child and feedback....
                         */
                        data:
                            "Logo", // ? [data] the property where we pass the data to track the drag element....
                        child: FlutterLogo(
                          /**
                           * ! [child] is the place where actual drag element persent....
                           */
                          size: 100,
                        ),
                        childWhenDragging: FlutterLogo(
                          /**
                           * ! [childWhenDragging] is the place where actual drag element persent when drag....
                           */
                          size: 50,
                        ),
                        feedback: Opacity(
                          /**
                           * ! [feedback] is the drag element....
                           */
                          opacity: 0.5,
                          child: FlutterLogo(
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight / 2,
                  child: DragTarget<String>(
                    onAccept: (data) {
                      // ? [onAccept] is the drag element reach the drag target....
                      acceptData = "accepted";
                    },
                    onLeave: (data) {
                      // ? [onLeave] is the drag element out of drag target....
                      acceptData = "leave";
                    },
                    onWillAccept: (data) {
                      // ? [onWillAccept] is the drag element reaches near to the drag target....
                      print(data);
                      acceptData = "willaccepted";
                      return true;
                    },
                    builder: (context, candidateData, rejectedData) {
                      /**
                       * ! with the help of the builder we can easy come up with ui change of the state....
                       */
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: acceptData == "accepted"
                            ? Center(
                                child: FlutterLogo(
                                  size: 100,
                                ),
                              )
                            : acceptData == "willaccepted"
                                ? Opacity(
                                    opacity: 0.3,
                                    child: Center(
                                      child: FlutterLogo(
                                        size: 100,
                                      ),
                                    ),
                                  )
                                : acceptData == "leave"
                                    ? Center(
                                        child: Container(
                                          child: Text("Out of drag Area"),
                                        ),
                                      )
                                    : Center(
                                        child: Container(
                                          child: Text("Drag in to green"),
                                        ),
                                      ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
