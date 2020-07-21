import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day64TweenAnimationBuilder extends StatefulWidget {
  Day64TweenAnimationBuilder({Key key}) : super(key: key);

  @override
  _Day64TweenAnimationBuilderState createState() =>
      _Day64TweenAnimationBuilderState();
}

class _Day64TweenAnimationBuilderState
    extends State<Day64TweenAnimationBuilder> {
  bool repeat = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ? What is TweenAnimationBuilder....
        /**
         * ! With the help of TweenAnimationBuilder we can create the custom animation effect to the user....
         */
        child: TweenAnimationBuilder<Color>(
          tween: repeat
              ? ColorTween(begin: Colors.red, end: Colors.green)
              : ColorTween(
                  begin: Colors.green,
                  end: Colors
                      .red), // ! it required the [tween] property to hold the tween value....
          duration: Duration(
              seconds: 3), // ! set the [duration] for the animation timing....
          curve: Curves
              .bounceInOut, // ! set the [curve] for the animation effect....
          builder: (context, value, child) => Container(
            // ! generate the [builder] to display the ui of the animation....
            width: 250,
            height: 250,
            color: value,
          ),
          onEnd: () {
            // ! ues the [onEnd] call back to get the end of the animation....
            print("Tween Animation Ends....");
            setState(() {
              repeat = !repeat;
            });
          },
        ),
      ),
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day064_tween_animation_builder.dart';
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
