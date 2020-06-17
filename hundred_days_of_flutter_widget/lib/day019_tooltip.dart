import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day19Tooltip extends StatefulWidget {
  Day19Tooltip({Key key}) : super(key: key);

  @override
  _Day19TooltipState createState() => _Day19TooltipState();
}

class _Day19TooltipState extends State<Day19Tooltip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Click and hold on the Views....",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Tooltip(
                  // ? What is Tooltip....
                  /**
               * ! with the help of tooltip we can give hint to the user....
               */
                  preferBelow: false,
                  /**
                 * tooltip have many properties like [preferBelow] if it set to false tip will show on the up of the tool....
                 */
                  textStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    backgroundColor: Colors.green,
                  ),
                  /**
                 * ! yes we can give text style for the tooltip....
                 */
                  message:
                      "This is tooltip from Container", // ! this is the place where we give the Tip Text....
                  child: Container(
                    // ? this is the place where we give the Tip Tool....
                    color: Colors.amber,
                    width: 100,
                    height: 100,
                  ),
                ),
                flex: 1,
              ),
              Flexible(
                child: Spacer(),
                flex: 1,
              ),
              Flexible(
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  tooltip: "This is tooltip from IconButton", // ? why here ....
                  /**
                 * ! yes some of the Widgets have the tooltips as the inbuild property....
                 * ! [IconButton] is the best example....
                 */
                ),
                flex: 1,
              ),
              Flexible(
                child: Spacer(),
                flex: 1,
              ),
              Flexible(
                child: Tooltip(
                  waitDuration: Duration(
                      seconds:
                          1), // ! we can specify the wait time for the hover....
                  showDuration: Duration(
                      seconds:
                          5), // ! and we can also specify the show time for the tooltip....
                  message: "This is tooltip from Image",
                  child: Image.asset("images/coffee.jpg"),
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      )),
      appBar: AppBar(
        title: Text("Tooltip"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day019_tooltip.dart';
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
