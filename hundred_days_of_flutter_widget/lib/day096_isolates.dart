import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

int fib(int n) {
  // This Fib function is use high memory and time to compute....
  int n1 = n - 1;
  int n2 = n - 2;
  if (n == 1) {
    return 0;
  } else if (n == 0) {
    return 1;
  } else {
    return (fib(n1) + fib(n2));
  }
}

class Day96Isolates extends StatefulWidget {
  Day96Isolates({Key key}) : super(key: key);

  @override
  _Day96IsolatesState createState() => _Day96IsolatesState();
}

class _Day96IsolatesState extends State<Day96Isolates> {
  String value = 'Fibonacci of 40 is 0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              // Text to display the output....
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            StaticAnimation(), // Repeat and Continuous Animation....
            RaisedButton(
              child: Text('Find fibonacci numbers in Main Isolate'),
              onPressed: () {
                int fib40 = fib(40); // ! call the fib as normal....
                setState(() {
                  value = 'Fibonacci of 40 is $fib40 by Main Isolate';
                });
              },
            ),
            RaisedButton(
              child: Text('Find fibonacci numbers in Compute Isolate'),
              onPressed: () async {
                int fib40 = await compute(
                    fib, 40); // ! call the fib with compute from isolate....
                setState(() {
                  value = 'Fibonacci of 40 is $fib40 by Compute Isolate';
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Isolate by Compute'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day096_isolates.dart';
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

class StaticAnimation extends StatefulWidget {
  @override
  _StaticAnimationState createState() => _StaticAnimationState();
}

class _StaticAnimationState extends State<StaticAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _rotationAnim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
    _rotationAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) => Transform.rotate(
        angle: _rotationAnim.value,
        child: Center(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
