import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day62ToggleButtons extends StatefulWidget {
  Day62ToggleButtons({Key key}) : super(key: key);

  @override
  _Day62ToggleButtonsState createState() => _Day62ToggleButtonsState();
}

class _Day62ToggleButtonsState extends State<Day62ToggleButtons> {
  List<bool> selected = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ? What is ToggleButtons....
        /**
         * ! ToggleButtons is the cool widget to perform the toggle operation between the widgets....
         * ! it required 3 property as important [children], [isSelected], [onPressed]....
         */
        child: ToggleButtons(
          children: [
            // ! [children] is to have the ui widget to display as toggle button....
            SizedBox(
                width: 100, height: 100, child: FittedBox(child: Text("edit"))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.wb_sunny,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.wb_cloudy,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.ac_unit,
                size: 50,
              ),
            )
          ],
          isSelected:
              selected, // ! [isSelected] is the property to display the selection of the listed widget....
          onPressed: (index) {
            // ! here we can handle the press event....
            setState(() {
              selected[index] = !selected[index];
            });
          },
          /**
           * ! and with the help of all these colors property we can fully customize the color of toggle button....
           */
          color: Colors.red,
          selectedColor: Colors.green,
          fillColor: Colors.green[100],
          focusColor: Colors.red[100],
          hoverColor: Colors.red[100],
          borderColor: Colors.deepPurple[800],
          highlightColor: Colors.black12,
          splashColor: Colors.black,
          selectedBorderColor: Colors.amber[800],
          renderBorder:
              true, // ? here we give the bool value for the isBoderDisplay or not.....
        ),
      ),
      appBar: AppBar(
        title: Text('ToggleButtons'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day062_toggle_buttons.dart';
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
