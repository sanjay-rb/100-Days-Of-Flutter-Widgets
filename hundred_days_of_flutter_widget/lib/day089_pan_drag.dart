import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day89PanDrag extends StatefulWidget {
  Day89PanDrag({Key key}) : super(key: key);

  @override
  _Day89PanDragState createState() => _Day89PanDragState();
}

class _Day89PanDragState extends State<Day89PanDrag> {
  Offset _offset;

  String onPanDragText;

  @override
  void initState() {
    super.initState();
    _offset = Offset(0, 0);
    onPanDragText = 'Start dragging up and down';
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            onPanDragText = 'onPanStart';
          });
        },
        onPanEnd: (details) {
          setState(() {
            onPanDragText = 'onPanEnd';
          });
        },
        onPanUpdate: (details) {
          // !here we get drag details for both vertical and horzontal axis as dx & dxy....
          // ! uncomment this for free drag....
          // setState(() {
          //     _offset = Offset(
          //       _offset.dx +
          //           details.delta.dx, // ! added the delta dx to offset dx....
          //       _offset.dy +
          //           details.delta.dy, // ! added the delta dy to offset dy....
          //     );
          //   });
          // ! here we constrain the drag area....
          bool isUp = -deviceHeight * 0.5 > _offset.dy;
          bool isDown = deviceHeight * 0.5 < _offset.dy;
          bool isRight = deviceWidth * 0.5 < _offset.dx;
          bool isLeft = -deviceWidth * 0.5 > _offset.dx;
          if (details.delta.dx < 0) {
            // ! on draging left....
            if (!isLeft) {
              // ! check is not left already.....
              setState(() {
                _offset = Offset(_offset.dx + details.delta.dx, _offset.dy);
              });
            }
          } else {
            // ! on draging right....
            if (!isRight) {
              // ! check is not right already.....
              setState(() {
                _offset = Offset(_offset.dx + details.delta.dx, _offset.dy);
              });
            }
          }
          if (details.delta.dy < 0.0) {
            // ! on draging up....
            if (!isUp) {
              // ! check is not Up already.....
              setState(() {
                _offset = Offset(_offset.dx, _offset.dy + details.delta.dy);
              });
            }
          } else {
            // ! on draging down....
            if (!isDown) {
              // ! check is not Down already.....
              setState(() {
                _offset = Offset(_offset.dx, _offset.dy + details.delta.dy);
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
              '$onPanDragText',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('PanDrag'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day089_pan_drag.dart';
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
