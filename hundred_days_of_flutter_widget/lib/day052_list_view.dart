import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListView is the simple widget to generate the list items....
    return ListView.separated(
      itemBuilder: (context, index) =>
          Text("Item Data : $index"), // ! to dynamic list generation....
      separatorBuilder: (context, index) => Divider(), // ! create seperator....
      itemCount: 50, // ! fixed the length....
      scrollDirection: Axis.vertical, // ! assign the axis to scroll....
    );
  }
}

class Day52ListView extends StatefulWidget {
  Day52ListView({Key key}) : super(key: key);

  @override
  _Day52ListViewState createState() => _Day52ListViewState();
}

class _Day52ListViewState extends State<Day52ListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPage(),
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day052_list_view.dart';
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
