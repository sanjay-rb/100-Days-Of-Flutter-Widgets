import 'package:flutter/material.dart';

class Day8FloatingActionButton extends StatefulWidget {
  Day8FloatingActionButton({Key key}) : super(key: key);

  @override
  _Day8FloatingActionButton createState() => _Day8FloatingActionButton();
}

class _Day8FloatingActionButton extends State<Day8FloatingActionButton> {
  bool _color = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FloatingActionButton"),),
      floatingActionButton: FloatingActionButton( // ? what is FloatingActionButton....
        child: Icon(Icons.add), // ? add the button icon....
        elevation: 10.0, // ! we can give the elevation....
        mini: false, // ! make change here to see the mini effect....
        onPressed: () {
          setState(() {
            _color = !_color; // ! toggle the colors and ui....
          });
        },
      ),
      floatingActionButtonLocation: _color
          ? FloatingActionButtonLocation.centerFloat
          : FloatingActionButtonLocation.centerDocked,
      /**
       * ! [floatingActionButtonLocation] to change the position of ....
       * ! such as : ---
       * * centerFloat, centerDocked, startTop, miniStartTop....
       * * endTop, endFloat, endDocked....
       */
      bottomNavigationBar: BottomAppBar(
        color: _color ? Colors.yellow : Colors.pink,
        child: Container(
          height: 60.0,
        ),
      ),
      body: Container(
        color: _color ? Colors.lightGreen : Colors.white,
      ),
    );
  }
}
