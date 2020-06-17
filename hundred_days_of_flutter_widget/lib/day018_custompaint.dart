import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day18CustomPaint extends StatefulWidget {
  Day18CustomPaint({Key key}) : super(key: key);

  @override
  _Day18CustomPaintState createState() => _Day18CustomPaintState();
}

class _Day18CustomPaintState extends State<Day18CustomPaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        /**
       * ? What is CustomPaint....
       * ! [CustomPaint] is the exhibitor who gives you a paper to draw on....
       */
        painter: MyPainter(),
        child: Center(
          child: Text("Custome Paint Body"),
        ),
      ),
      appBar: AppBar(
        title: Text("CustomPaint"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day018_custompaint.dart';
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

class MyPainter extends CustomPainter {
  /// ! [MyPainter] as [CustomPainter] is the Painter....

  /// ! It is Me, The Painter....

  Paint p = Paint();
  // ? What is Paint....
  /// ! [p] as [Paint] Yes, it is your Paint Brush....

  /// ! with the help pf Paint we can pick color, perform shades, fill color, etc....

  @override
  void paint(Canvas canvas, Size size) {
    /**
     * ! [canvas]  is the paper where u can draw the paint....
     * ! The height and the width of the paper[canvas] is given in the [size]....
     */
    p..color = Colors.red; // ! we can give the pick color...
    p..strokeWidth = 5; // ! we can adjust the thickness....
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height),
        p); // ! and we can darw the line [drawLine]....

    p..color = Colors.green; // ! we can give the pick color...
    p..style = PaintingStyle.stroke; // ! we can adjust the style....
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100,
        p); // ! and we can darw the Circle [drawCircle]....

    Path path =
        Path(); // ! with the help of [path] we can travel arround the canvas....
    path.moveTo(size.width - 250, size.height - 100); // start from here....
    // custom rectangle....
    path.lineTo(size.width - 100, size.height - 100);
    path.lineTo(size.width - 100, size.height - 250);
    path.lineTo(size.width - 250, size.height - 250);
    path.lineTo(size.width - 250, size.height - 100);

    p..color = Colors.amber; // ! we can give the pick color...
    p..invertColors = true; // ! we can invert the color or the Image....
    p..style = PaintingStyle.fill; // ! we can adjust the style....
    canvas.drawPath(path, p); // ! and we can darw through Path [drawPath]....
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return true; // ! we can check the parameters with [oldDelegate] object....
  }
}
