import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day43AnimatedSwitcher extends StatefulWidget {
  Day43AnimatedSwitcher({Key key}) : super(key: key);

  @override
  _Day43AnimatedSwitcherState createState() => _Day43AnimatedSwitcherState();
}

class _Day43AnimatedSwitcherState extends State<Day43AnimatedSwitcher> {
  var _viewItem;

  var _widthItem = ClipRRect(
    child: Container(
      color: Colors.deepOrange,
      width: 250,
      height: 100,
      child: Center(
        child:
            Text("Click", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
    borderRadius: BorderRadius.circular(10.0),
  );

  var _heightItem = ClipRRect(
    child: Container(
      color: Colors.deepPurple,
      width: 100,
      height: 250,
      child: Center(
        child:
            Text("Click", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
  @override
  void initState() {
    super.initState();
    _viewItem = _widthItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _viewItem = _viewItem == _widthItem
                  ? _heightItem
                  : _widthItem; // ! here we toggle the item....
            });
          },
          child: Center(
            /**
             * ? What is AnimatedSwitcher....
             * ! AnimatedSwitcher is the cool flutter widget....
             * ! Where we can switch between the Widgets by cool animation....
             */
            child: AnimatedSwitcher(
              // ! [duration] is important property where we give the time duration
              duration: const Duration(milliseconds: 500),
              // ! [transitionBuilder] is the place we can customize the default FadeTransition...
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(begin: 0.0, end: 3.0).animate(animation),
                child: child,
              ),
              // ! [child] is the property for apply changes....
              child: Container(
                // * very important point to perfrom the AnimatedSwitcher is key....
                // * yes, we needed to provide the key for each widget....
                key: ValueKey<ClipRRect>(_viewItem),
                child: _viewItem, // ! we apply the viewItem here....
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AnimatedSwitcher"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day043_animated_switcher.dart';
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
