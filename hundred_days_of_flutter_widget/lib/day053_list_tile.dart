import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListView is the simple widget to generate the list items....
    return ListView.separated(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          // ? What is ListTile....
          /**
         * ! ListTile is the cool Widget for the List items....
         * ! we can able to provide the multiple views in material design tile....
         */
          leading: FittedBox(
            // ! we can add the leading image or widget....
            fit: BoxFit.fill,
            child: FlutterLogo(
              size: 100,
            ),
          ),
          title: Text(
              "Item Data : $index"), // ! we can add title text or widget....
          trailing: Icon(
            // ! we can add the trail icon or widget....
            Icons.star,
            color: Colors.yellow,
          ),
          subtitle: Text(// ! we can add the subtitles....
              "Hi there, This is Sanjay! This is the cool subtitle of the $index"),
          isThreeLine: true, // ! and also specify the line space is 3 or 2....
        ),
      ), // ! to dynamic list generation....
      separatorBuilder: (context, index) => Divider(), // ! create seperator....
      itemCount: 50, // ! fixed the length....
      scrollDirection: Axis.vertical, // ! assign the axis to scroll....
    );
  }
}

class Day53ListTile extends StatefulWidget {
  Day53ListTile({Key key}) : super(key: key);

  @override
  _Day53ListTileState createState() => _Day53ListTileState();
}

class _Day53ListTileState extends State<Day53ListTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPage(),
      appBar: AppBar(
        title: Text("ListTile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day053_list_tile.dart';
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
