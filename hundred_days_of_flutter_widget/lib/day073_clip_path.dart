import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day73ClipPath extends StatelessWidget {
  const Day73ClipPath({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: ClipPath(
              // ! here we added the clippath to the square Container Box....
              clipper:
                  MyCustomClipper(), // ! at the [clipper] property we added the CustomClipper<Path>....
              child: Container(
                // ! Here we added the square Container Box of 250x250....
                width: 250,
                height: 250,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('ClipPath'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day073_clip_path.dart';
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

class MyCustomClipper extends CustomClipper<Path> {
  // ! Here we extends the [CustomClipper<Path>] into [MyCustomClipper]....
  @override
  getClip(Size size) {
    // ! this [getClip] will return the clip path to the clipper property....
    double width = size.width; // we get the width of the box here....
    double height = size.height; // we get the height of the box here....
    Path path = new Path(); // ! init the new path... to return...

    Offset startPointOfQuadraticBezierCurve =
        Offset(width * 0.0, height * 0.5); // here we added the start point....
    Offset controlPointOfQuadraticBezierCurve = Offset(
        width * 0.5, height * 1.0); // here we added the curve control point....
    Offset endPointOfQuadraticBezierCurve =
        Offset(width * 1.0, height * 0.5); // here we added the end point....

    path.moveTo(
        startPointOfQuadraticBezierCurve.dx,
        startPointOfQuadraticBezierCurve
            .dy); // ! we move the path to start point...
    path.quadraticBezierTo(
      controlPointOfQuadraticBezierCurve.dx,
      controlPointOfQuadraticBezierCurve.dy,
      endPointOfQuadraticBezierCurve.dx,
      endPointOfQuadraticBezierCurve.dy,
    ); // ! and draw the path to quadraticBezier Curve...
    path.lineTo(width * 1.0,
        height * 0.0); // ! we completed the curve and now move to the top....
    path.lineTo(width * 0.0,
        height * 0.0); // ! finally comes to the starting position....

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) =>
      oldClipper != this; // ! here we added the reload conflit condition...
}
