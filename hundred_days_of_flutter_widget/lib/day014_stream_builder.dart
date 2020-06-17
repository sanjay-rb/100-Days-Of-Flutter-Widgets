import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day14StreamBuilder extends StatefulWidget {
  Day14StreamBuilder({Key key}) : super(key: key);

  @override
  _Day14StreamBuilderState createState() => _Day14StreamBuilderState();
}

class _Day14StreamBuilderState extends State<Day14StreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        // ? what is StreamBuilder....
        stream: NumberCounter().stream,
        /**
       * ! [stream] is the important property and it's carry the dynamic value.... 
       */
        initialData:
            null, // ! [initialData] have the first or substitute value....
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /**
         * ! [builder] is the very sensitive property....
         * ! why because it's is get the dynamic value from the stream via snapshot....
         * ! here we manilupate and display the value....
         */
          return Container(
            child: Center(
              child: _uiText(
                  snapshot), // ? [_uiText] is custom funtion defined below....
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("StreamBuilder"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day014_stream_builder.dart';
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

_uiText(AsyncSnapshot snapshot) {
  switch (snapshot.connectionState) {
    // ? this switch case check for the Current state of Snapshot....
    case ConnectionState
        .none: // ! check weathe it is null or non Async Stream....
      return Text("ConnectionState.none Current Data is ${snapshot.data}");
      break;
    case ConnectionState
        .waiting: // ! waiting for the values from the Stream....
      return Text("ConnectionState.waiting Current Data is ${snapshot.data}");
      break;
    case ConnectionState
        .active: // ! when the Stream is runnung in the background....
      return Text("ConnectionState.active Current Data is ${snapshot.data}");
      break;
    case ConnectionState.done: // ! once when the Stream finish giving value....
      return Text("ConnectionState.done Current Data is ${snapshot.data}");
      break;
  }
}

class NumberCounter {
  // ? Stream creator class....
  var _counter = 0; // ! counter stream....

  final _controller = StreamController<int>(); // ? what is StreamController?
  /// ! with the help of StreamController we can create | manipuate on streams....

  NumberCounter() {
    Timer.periodic(Duration(seconds: 2), (t) {
      _controller.sink.add(_counter); // ! covert [_counter] to stream....
      if (_counter < 5) {
        _counter++;
      } else {
        _controller.close(); // ! finish the stream...
      }
    });
  }
  Stream<int> get stream =>
      _controller.stream; // ! getter for the stream value....
}
