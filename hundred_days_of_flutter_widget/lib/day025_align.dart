import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day25Align extends StatelessWidget {
  const Day25Align({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.70,
          color: Colors.green,
          child: Align(
            // ? what is Align....
            alignment: Alignment.bottomCenter,
            /**
           * ! [alignment] is the important property for the Align Widget....
           * ! we can make the child align to the parent....
           * there are the main Alignments such as:-
           * * center, centerRight, centerLeft....
           * * bottomCenter, bottomRight, bottomLeft....
           * * topCenter, topRight, topLeft....
           */
            child: Text(
                "Hello World!"), // ! you can see this Hello World at the bottom Center of the container....
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Align"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day025_align.dart';
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
