import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day81CheckboxListTile extends StatefulWidget {
  Day81CheckboxListTile({Key key}) : super(key: key);

  @override
  _Day81CheckboxListTileState createState() => _Day81CheckboxListTileState();
}

class _Day81CheckboxListTileState extends State<Day81CheckboxListTile> {
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ? What is CheckboxListTile....
        // ! CheckboxListTile = CheckBox + ListTile....
        // We have all the ListTile property.....
        // And also the CheckBox property....
        child: CheckboxListTile(
          value: _isChecked, // ! here we added the value as bool....
          onChanged: (value) {
            // and manage the state ad the [onChanged] callback....
            setState(() {
              _isChecked = value;
            });
          },
          title: Text("Check Box!"), // ! here comes the title of [ListTile]....
          secondary: Icon(Icons
              .check), // ! and here is the secondary for the [ListTile]....
          controlAffinity: _isChecked
              ? ListTileControlAffinity.trailing
              : ListTileControlAffinity.leading,
        ),
      ),
      appBar: AppBar(
        title: Text('CheckboxListTile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day081_checkbox_list_tile.dart';
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
