import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day59AnimatedCrossFade extends StatefulWidget {
  Day59AnimatedCrossFade({Key key}) : super(key: key);

  @override
  _Day59AnimatedCrossFadeState createState() => _Day59AnimatedCrossFadeState();
}

class _Day59AnimatedCrossFadeState extends State<Day59AnimatedCrossFade> {
  bool _toggle = true;
  _setState() {
    print(_toggle);
    setState(() {
      _toggle = !_toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: GestureDetector(
          onTap: () => _setState(),
          child: AnimatedCrossFade(
            /**
             * ? What is AnimatedCrossFade....
             * ! AnimatedCrossFade is same as the AnimatedSwitcher but only 2 widget....
             * ! it requried [firstChild], [secondChild]....
             */
            firstChild: Stack(
              // ! this [firstChild] holds the initial Widget....
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image.asset(
                    "images/logo.gif",
                    fit: BoxFit.fill,
                  ),
                  width: 250,
                  height: 250,
                ),
                Text(
                  "Click Here",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            secondChild: Stack(
              // ! this [secondChild] holds the secondary Widget....
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image.asset(
                    "images/coffee.jpg",
                    fit: BoxFit.fill,
                  ),
                  width: 250,
                  height: 250,
                ),
                Text(
                  "Click Here",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            crossFadeState:
                // ! [crossFadeState] is the important widget for the user to display ui....
                _toggle ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(
                seconds: 1), // ! [duration] is the start animation timing....
            reverseDuration: Duration(
                seconds:
                    2), // ! [reverseDuration] is the end animation timing....
            alignment: Alignment.center, // ! is for alignment....
            firstCurve: Curves
                .easeIn, // ! Animation curve for first widget animation....
            secondCurve: Curves
                .bounceIn, // ! Animation curve for second widget animation....
          ),
        ),
      )),
      appBar: AppBar(
        title: Text("AnimatedCrossFade"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day059_animated_cross_fade.dart';
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
