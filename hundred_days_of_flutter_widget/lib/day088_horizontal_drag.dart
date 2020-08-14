import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day88HorizontalDrag extends StatefulWidget {
  @override
  _Day88HorizontalDragState createState() => _Day88HorizontalDragState();
}

class _Day88HorizontalDragState extends State<Day88HorizontalDrag> {
  Offset _offset;

  String onHorizontalDragText;

  String isDragLeftOrRight;

  @override
  void initState() {
    super.initState();
    _offset = Offset(0, 0);
    onHorizontalDragText = 'Start dragging up and down';
    isDragLeftOrRight = 'Drag Status';
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          setState(() {
            onHorizontalDragText = 'onHorizontalDragStart';
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            onHorizontalDragText = 'onHorizontalDragEnd';
            isDragLeftOrRight = 'Dragging Stopped';
          });
        },
        onHorizontalDragUpdate: (details) {
          bool isRight = deviceWidth * 0.8 < _offset.dx;
          bool isLeft = -deviceWidth * 0.8 > _offset.dx;
          if (details.delta.dx < 0) {
            // ! on draging left....
            if (!isLeft) {
              // ! check is not left already.....
              setState(() {
                isDragLeftOrRight = "Dragging Left";
                _offset = Offset(_offset.dx + details.delta.dx, _offset.dy);
              });
            }
          } else {
            // ! on draging right....
            if (!isRight) {
              // ! check is not right already.....
              setState(() {
                isDragLeftOrRight = "Dragging Right";
                _offset = Offset(_offset.dx + details.delta.dx, _offset.dy);
              });
            }
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight,
              color: Colors.yellow,
            ),
            Transform.translate(
              offset:
                  _offset, // ! This is the Container with blue color is Draggable by Translate....
              child: Container(
                width: deviceWidth,
                height: deviceHeight,
                color: Colors.blue,
              ),
            ),
            Center(
                child: Text(
              '$onHorizontalDragText\n$isDragLeftOrRight',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HorizontalDrag'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day088_horizontal_drag.dart';
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
