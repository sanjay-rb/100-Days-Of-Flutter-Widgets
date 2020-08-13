import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day87VerticalDrag extends StatefulWidget {
  Day87VerticalDrag({Key key}) : super(key: key);

  @override
  _Day87VerticalDragState createState() => _Day87VerticalDragState();
}

class _Day87VerticalDragState extends State<Day87VerticalDrag> {
  Offset _offset;
  String onVerticalDragText;
  String isDragUpOrDown;

  @override
  void initState() {
    super.initState();
    _offset = Offset(0, 0);
    onVerticalDragText = 'Start dragging up and down';
    isDragUpOrDown = 'Drag Status';
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragStart: (details) {
          setState(() {
            onVerticalDragText = 'onVerticalDragStart';
          });
        },
        onVerticalDragEnd: (details) {
          setState(() {
            onVerticalDragText = 'onVerticalDragEnd';
            isDragUpOrDown = 'Dragging Stopped';
          });
        },
        onVerticalDragUpdate: (details) {
          bool isUp = -deviceHeight * 0.5 > _offset.dy;
          bool isDown = deviceHeight * 0.5 < _offset.dy;
          if (details.delta.dy < 0.0) {
            // ! on draging up....
            if (!isUp) {
              // ! check is not Up already.....
              setState(() {
                isDragUpOrDown = 'Dragging Up';
                _offset = Offset(_offset.dx, _offset.dy + details.delta.dy);
              });
            }
          } else {
            // ! on draging down....
            if (!isDown) {
              // ! check is not Down already.....
              setState(() {
                isDragUpOrDown = 'Dragging Down';
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
              '$onVerticalDragText\n$isDragUpOrDown',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('VerticalDrag'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day087_vertical_drag.dart';
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
