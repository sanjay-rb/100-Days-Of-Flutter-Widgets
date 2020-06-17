import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // ? I have used the http pkg for fetch data ....
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart'; // ? I have used the inbuild convert of dart for json convertion....

class Day6FutureBuilder extends StatefulWidget {
  Day6FutureBuilder({Key key}) : super(key: key);

  @override
  _Day6FutureBuilderState createState() => _Day6FutureBuilderState();
}

class _Day6FutureBuilderState extends State<Day6FutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day006_future_builder.dart';
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
        child: FutureBuilder(
          // ? What is FutureBuilder....
          future: http.get(
              "http://www.json-generator.com/api/json/get/cesFfSXQpu?indent=2"),
          /**
           * ? [future] value store the real fetching data callback....
           * ! data in server....
           * * {
           * * "text": "This Data is from Server...."
           * * }
           */
          initialData: "Waiting for the Record....",
          /**
           * ! this data is going to be display during the fetching time.... 
           */

          builder: (context, snapshot) {
            /**
             * ! we can get data from the snapshot like [snapshot.data]....
             * ! also we can check the state by [snapshot.connectionState]....
             */
            if (snapshot.connectionState == ConnectionState.done) {
              // ? here we check the connection....
              return Center(
                child: Text(json.decode((snapshot.data.body))["text"]),
                /**
                 * ! here we decoed the data and get the value of [text] from the server.... 
                 */
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(), // ? [CircularProgressIndicator] is used to show the progress....
                    Text(
                      snapshot.data.toString(),
                    ), // ?  here we print the inital data from the [initialData] property....
                    Text(
                      snapshot.connectionState.toString(),
                    ) // ? here we watch the current state of the connection....
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
