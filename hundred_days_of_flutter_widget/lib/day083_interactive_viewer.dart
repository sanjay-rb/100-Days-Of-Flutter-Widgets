import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day83InteractiveViewer extends StatefulWidget {
  Day83InteractiveViewer({Key key}) : super(key: key);

  @override
  _Day83InteractiveViewerState createState() => _Day83InteractiveViewerState();
}

class _Day83InteractiveViewerState extends State<Day83InteractiveViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ? What is InteractiveViewer....
        // ! InteractiveViewer is the cool widget added in flutter 1.20....
        // here we can get full interaction on the widgets....
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20.0),
          minScale: 0.1,
          maxScale: 1.6,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.orange, Colors.red],
                stops: <double>[0.0, 1.0],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('InteractiveViewer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day083_interactive_viewer.dart';
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
