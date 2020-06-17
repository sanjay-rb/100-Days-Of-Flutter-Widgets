import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day13FadeInImage extends StatefulWidget {
  Day13FadeInImage({Key key}) : super(key: key);

  @override
  _Day13FadeInImageState createState() => _Day13FadeInImageState();
}

class _Day13FadeInImageState extends State<Day13FadeInImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeInImage"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day013_fadein_image.dart';
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
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  // ? What is FadeInImage....
                  placeholder: 'images/logo.gif',
                  /**
               * ! [placeholder] is the place where the waiting image is placed....
               */
                  image:
                      'https://ctl.s6img.com/society6/img/CY-f61AQhqaiP-V8FvHMnxB7pac/w_700/prints/~artwork/s6-original-art-uploads/society6/uploads/misc/163bf4428ec744778fc04bc7eedf7465/~~/smiley-face-cute-simple-smiling-happy-face-prints.jpg',
                  /**
               * ! [image] store the network image link....
               */
                  fadeInDuration: Duration(
                      seconds:
                          1), // ? we can provide the new image animation timing here....
                  fadeOutDuration: Duration(
                      seconds:
                          1), // ? we can provide the old image animation timing here....
                  fadeInCurve: Curves
                      .bounceIn, // ? we can provide the new image animation type here....
                  fadeOutCurve: Curves
                      .bounceOut, // ? we can provide the old image animation type here....
                  fit: BoxFit
                      .fill, // ? can use the fit property to adjust the image....
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
