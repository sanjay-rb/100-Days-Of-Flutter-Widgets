import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day5Opacity extends StatefulWidget {
  Day5Opacity({Key key}) : super(key: key);

  @override
  _Day5OpacityState createState() => _Day5OpacityState();
}

class _Day5OpacityState extends State<Day5Opacity> {
  bool _opacity = false;
  @override
  Widget build(BuildContext context) {
    bool checkAnimation =
        true; // ! change here to find the differents between the Opacity and AnimatedOpacity....

    var withAnimation = AnimatedOpacity(
      // ? what is AnimatedOpacity....
      duration: Duration(milliseconds: 500),
      /**
       * ! Yes we can perform the animation with the help of [duration] property in AnimatedOpacity....
       */
      opacity: _opacity ? 0.0 : 1.0,
      /**
       * ! [opacity] is the property for make hide and perform the transparency in child....
       * ! we can specify the values between 0.0 to 1.0....
       * ! 0.0 - transparent....
       * ! 1.0 - visible....  
       */

      child: Center(
        child: Container(
          width: 250,
          height: 250,
          color: Colors.deepPurple,
        ),
      ),
    );

    var withoutAnimation = Opacity(
      // ? what is Opacity....

      opacity: _opacity ? 0.0 : 1.0,
      /**
       * ! [opacity] is the property for make hide and perform the transparency in child....
       * ! we can specify the values between 0.0 to 1.0....
       * ! 0.0 - transparent....
       * ! 1.0 - visible....  
       */
      child: Center(
        child: Container(
          width: 250,
          height: 250,
          color: Colors.deepPurple,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day005_opacity.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = !_opacity;
            });
          },
          child: checkAnimation ? withAnimation : withoutAnimation,
        ),
      ),
    );
  }
}
