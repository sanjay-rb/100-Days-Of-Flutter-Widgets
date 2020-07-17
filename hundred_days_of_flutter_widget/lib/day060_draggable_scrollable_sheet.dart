import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day60DraggableScrollableSheet extends StatefulWidget {
  Day60DraggableScrollableSheet({Key key}) : super(key: key);

  @override
  _Day60DraggableScrollableSheetState createState() =>
      _Day60DraggableScrollableSheetState();
}

class _Day60DraggableScrollableSheetState
    extends State<Day60DraggableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ? What is DraggableScrollableSheet....
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "This is BackSide",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            DraggableScrollableSheet(
              /**
               * ! DraggableScrollableSheet is the cool widget which widely used in the mobiles....
               * ! when a bottm sheet is drag lead to scrollable list....
               */
              expand: true, // ! weather the builder item fill the space....
              initialChildSize:
                  0.10, // ! intial size when the page is loaded or reloaded....
              maxChildSize: 0.90, // ! max size with the sheet is scroll up....
              minChildSize:
                  0.10, // ! min size with the sheet is scroll down....
              builder:
                  // ! here the list item is build with context and scroll controller....
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: Colors.blue[100],
                  child: ListView.builder(
                    // ! to showcase the scroll function we added the listview here....
                    controller:
                        scrollController, // ! added the parent scroll controller here....
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item ${index + 1}'));
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('DraggableScrollableSheet'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day060_draggable_scrollable_sheet.dart';
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
