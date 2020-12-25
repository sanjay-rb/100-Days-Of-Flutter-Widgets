import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day80Padding extends StatefulWidget {
  const Day80Padding({Key key}) : super(key: key);

  @override
  _Day80PaddingState createState() => _Day80PaddingState();
}

class _Day80PaddingState extends State<Day80Padding> {
  static var all = const EdgeInsets.all(150.0); // EdgeInsets for all side.....
  static var only = const EdgeInsets.only(
    top: 250,
    bottom: 250,
  ); // EdgeInsets for top and bottom side....
  static var ltrb = EdgeInsets.fromLTRB(
      100, 100, 100, 100); // EdgeInsets for all side by LTRB....
  static var symmetric = EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 50); // EdgeInsets for vertical and horizontal....

  var selected = [all, only, ltrb, symmetric];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.filter_1), label: "All"),
          BottomNavigationBarItem(icon: Icon(Icons.filter_2), label: "Only"),
          BottomNavigationBarItem(icon: Icon(Icons.filter_3), label: "LTRB"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_4), label: "Symmertic"),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            print(value);
            index = value;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple[100],
      ),
      body: SafeArea(
        // ? What is Padding....
        child: Padding(
          padding: selected[index], // ! You can add the EdgeInsets here....
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.deepOrange,
            child: Center(child: Text("${selected[index]}")),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Padding'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day080_padding.dart';
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
