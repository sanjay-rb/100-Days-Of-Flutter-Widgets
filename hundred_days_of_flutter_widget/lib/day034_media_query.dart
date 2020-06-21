import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day34MediaQuery extends StatelessWidget {
  const Day34MediaQuery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context); // ? What is MediaQuery....
    /**
     * ! [MediaQuery] is the very super feature in the Flutter....
     * ! with the help of MediaQuery we can able to get the property of the devices....
     * ! even it is web, tanlet, smartphone of variety of sizes....
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day034_media_query.dart';
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
          /**
           * ! this Container is fixed to the size of 100% of device size....
           * ! and fill with light red color....
           */
          width: device.size.width * 1,
          height: device.size.height * 1,
          color: Colors.red[100],
          child: Center(
            child: Container(
              /**
               * ! this Container is fixed to the size of 50% of device size....
               * ! and fill with light yellow color....
               */
              width: device.size.width * 0.5,
              height: device.size.height * 0.5,
              color: Colors.yellow[100],
              child: Center(
                child: Container(
                  /**
                   * ! this Container is fixed to the size of 25% of device size....
                   * ! and fill with green yellow color....
                   */
                  width: device.size.width * 0.25,
                  height: device.size.height * 0.25,
                  color: Colors.green[100],
                  child: Center(
                    child: Text(device.orientation == Orientation.portrait
                        ? "Portrait"
                        : "Landscape"),
                    /**
                     * ! we can even get the orientation of the device like above....
                     */
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
