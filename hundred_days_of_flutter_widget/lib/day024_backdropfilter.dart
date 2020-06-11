import 'dart:ui';

import 'package:flutter/material.dart';

class Day24BackdropFilter extends StatelessWidget {
  const Day24BackdropFilter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Text('0' *
            10000), // ! Simply printed the 10000 of zeros ad the background....
        Center(
          child: BackdropFilter(
            // ? What is BackdropFilter....
            /**
             * ! with the help of [BackdropFilter] we can able to make the background blur....
             * ! [filter] is the requried property which get the ImageFilter as the value....
             * ! child is the Container where we apply the blur effect....
             * ! there will no effect when we give the width and height to the Container! yes it will always cover fullscreen....
             * ! if we click to clip the blur effect we can warp [BackdropFilter] widget with ClipRect....
             */
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
              // ? [sigma] is the density of blur on X, Y accordingly....
            ),
            child: Container( // ? An empty container for effect the blur....
              child: Text("Area Cover By Container is actually blur"),
            ),
          ),
        ),
      ],
    );
  }
}
