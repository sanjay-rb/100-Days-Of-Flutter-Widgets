import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// ? What is AnimatedWidget....

/// ! AnimatedWidget is the cool abstract class for create custom Transition....

/// ! before that learn the FooTransisiton (AlignTransition, FadeTransition, etc.,)....

class SpinTransition extends AnimatedWidget {
  /// ! with the help of constructor....

  /// ! we passes the animation controller to the listenable....

  const SpinTransition({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress =>
      listenable; // ! added the AnimatedWidget->listenable to the _progress....

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value *
          2.0 *
          pi, // used the _progress as simple animation value....
      child: Container(
        width: 250,
        height: 250,
        color: Colors.deepOrange,
      ),
    );
  }
}

class Day79AnimatedWidget extends StatefulWidget {
  @override
  _Day79AnimatedWidgetState createState() => _Day79AnimatedWidgetState();
}

class _Day79AnimatedWidgetState extends State<Day79AnimatedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinTransition(
          // ! here we added the SpinTransition as simple widget....
          controller: _controller,
        ),
      ),
      appBar: AppBar(
        title: Text('AnimatedWidget'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day079_animated_widgets.dart';
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
