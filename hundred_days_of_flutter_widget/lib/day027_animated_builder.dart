import 'dart:math';

import 'package:flutter/material.dart';

class Day27AnimatedBuilder extends StatefulWidget {
  @override
  _Day27AnimatedBuilderState createState() => _Day27AnimatedBuilderState();
}

class _Day27AnimatedBuilderState extends State<Day27AnimatedBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _rotationAnim;

  @override
  void initState() {
    super.initState();
    // On init state we actually set the controller and animation....
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(); // the contorller....
    _rotationAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller); //  the tween animation....
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ? What is AnimatedBuilder....
    /**
     * [AnimatedBuilder] is the simplest way to perform the animation on to the flutter app....
     * this requried two attribute [animation] & [builder]....
     */
    return AnimatedBuilder(
      /**
       * this [animation] accept Any Listenable Elements like (AnimationController, Draggable, Scrollable, etc..,)....
       */
      animation: _controller, // ? here we give the AnimationController....
      /**
       * this [builder] will funtion of two values that's (BuildContext context,Widget child)....
       * we needed to return the Ui whichc carry the animation value....
       */
      builder: (BuildContext context,Widget child) => Transform.rotate(
        angle: _rotationAnim.value, // ? here we give the Animation value...
        child: Center( // This animation effect is (A 250x250Container going to be rotate at center)....
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
