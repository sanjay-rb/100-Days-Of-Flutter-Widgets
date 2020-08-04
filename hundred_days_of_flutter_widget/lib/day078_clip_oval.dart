import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day78ClipOval extends StatelessWidget {
  const Day78ClipOval({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        // ! Simpley a clipper to clip oval shape....
        child: ClipOval(child: Image.asset('images/coffee.jpg')),
      )),
      appBar: AppBar(
        title: Text('ClipOval'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day078_clip_oval.dart';
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
