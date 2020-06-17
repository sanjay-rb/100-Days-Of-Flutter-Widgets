import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day3Wrap extends StatelessWidget {
  const Day3Wrap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isRow = true; // change [false] to toggle between Row and Column....
    return Scaffold(
      appBar: AppBar(
        title: Text("Warp"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day003_wrap.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: Container(
        child: Wrap(
          direction: isRow
              ? Axis.horizontal
              : Axis
                  .vertical, // ? we can use the [direction] for give the children arrange in row or column....
          spacing:
              10.0, // ? [spacing] here we give the space between the object or children....
          runSpacing:
              10.0, // ? [runSpacing] here we give the space between the one line to another line of children....

          alignment: WrapAlignment
              .start, // ? [alignment] here we give the aling between the object or children....
          runAlignment: WrapAlignment
              .start, // ? [runAlignment] here we give the aling between the one line to another line of children....
          /**
                 * ! we have WrapAlignments like:-
                 * * start - Place the objects as close to the start of the axis as possible.
                 * * end - Place the objects as close to the end of the axis as possible.
                 * * center - Place the objects as close to the middle of the axis as possible.
                 * * spaceAround - Place the free space evenly between the objects as well as half of that space before and after the first and last objects.
                 * * spaceBetween - Place the free space evenly between the objects.
                 * * spaceEvenly - Place the free space evenly between the objects as well as before and after the first and last objects.
                 */

          crossAxisAlignment: WrapCrossAlignment
              .start, // ? [crossAxisAlignment] to aling the opposite axis of main [direction]....
          /**
                 * ! we have WrapCrossAlignment like:-
                 * * start - Place the children as close to the start of the run in the cross axis as possible.
                 * * end - Place the children as close to the end of the run in the cross axis as possible.
                 * * center - Place the children as close to the middle of the run in the cross axis as possible.
                 */
          textDirection: TextDirection
              .ltr, // ? [textDirection] determine the order of child in row....
          /**
                 * ! we have TextDirection.rtl and TextDirection.ltr....
                 * ! we can control the row start here....
                 */

          verticalDirection: VerticalDirection
              .down, // ? [verticalDirection] determine the order of child in column....
          /**
                 * ! we have VerticalDirection.up and VerticalDirection.down....
                 * ! we can control the column start here....
                 */

          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.pink,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.lime,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.indigo,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.purple,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
