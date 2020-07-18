import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day61ColorFiltered extends StatelessWidget {
  const Day61ColorFiltered({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /**
         * ? what is ColorFiltered....
         * ! It's easy to play around with color in Flutter widgets, and not just by modifying a color parameter.
         * ! [colorFilter] is the property to change the widget color.
         */
        child: ColorFiltered(
          /**
           * ! here we accept the color and blendmode as the input.
           * ! there are many blendmode like :-
           * * [clear] - Drop both the source and destination images, leaving nothing.
           * * [src] - Drop the destination image, only paint the source image.
           * * [dst] - Drop the source image, only paint the destination image.
           * * [colorBurn] - Divide the inverse of the destination by the source, and inverse the result.
           * * .....  and so many....
           */
          colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
          child: Container(
            width: 250,
            height: 250,
            color: Colors.blue,
            child: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "images/coffee.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('ColorFiltered'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day061_color_filtered.dart';
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
