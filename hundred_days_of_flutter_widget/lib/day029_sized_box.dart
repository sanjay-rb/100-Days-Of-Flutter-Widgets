import 'package:flutter/material.dart';

class Day29SizedBox extends StatelessWidget {
  const Day29SizedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizedBox"),
      ),
      body: Center(
        child: SizedBox(
            // ? What is SizedBox....
            /**
             * ! Creates a fixed size box....
             * ! The [width] and [height] parameters can be null to indicate that the size of the box....
             * ! so that the chlid will set to the size of the box....
             */
            width: 250, // ? her we fix width to 250....
            height: 250, // ? her we fix height to 250....
            child: RaisedButton(
              // ! so that RaisedButton fixed to size 250x250....
              onPressed: () {},
              child: Text("Click Me...."),
            )),
      ),
    );
  }
}
