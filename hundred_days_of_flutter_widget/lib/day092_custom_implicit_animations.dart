import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day92CustomImplicitAnimations extends StatefulWidget {
  Day92CustomImplicitAnimations({Key key}) : super(key: key);

  @override
  _Day92CustomImplicitAnimationsState createState() =>
      _Day92CustomImplicitAnimationsState();
}

class _Day92CustomImplicitAnimationsState
    extends State<Day92CustomImplicitAnimations> {
  double _sliderValue = 0.0;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ! We can create the custom implicit animation for any widget with [TweenAnimationBuilder]....
          TweenAnimationBuilder<Color>(
            duration: const Duration(seconds: 5),
            curve: Curves.elasticOut,
            tween: ColorTween(
              begin: Colors.white,
              end: _newColor,
            ), // ! if the animation is have final Tween value pls make it final static for performance....
            child: Container(
              width: 250,
              height: 250,
              color: Colors.white,
              child: FlutterLogo(
                size: 250,
              ),
            ), // ! always try to add static widgets in [child] for the performance....
            builder: (BuildContext context, Color valueColor, Widget child) =>
                ColorFiltered(
              child: child,
              colorFilter: ColorFilter.mode(valueColor, BlendMode.modulate),
            ),
          ),
          Slider.adaptive(
            value: _sliderValue,
            onChanged: (value) => setState(() {
              _sliderValue = value;
              _newColor = Color.lerp(Colors.white, Colors.yellow, _sliderValue);
            }),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Custom Implicit Animations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day092_custom_implicit_animations.dart';
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
