import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day55SelectableText extends StatelessWidget {
  const Day55SelectableText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          // ? What is SelectableText....
          /**
           * ! SelectableText is the good widget to make tha normal text into selectable one....
           * ! it can do multiple options like copy, select all, paste, cut....
           */
          child: SelectableText(
            // ! here we added the text....
            "Clash of Clans is a freemium " +
                "mobile strategy video game developed and published " +
                "by Finnish game developer Supercell. " +
                "The game was released for iOS platforms on August 2, 2012, " +
                "and on Google Play for Android on October 7, 2013.",
            enableInteractiveSelection:
                true, // ! it make the selection view (false - selection invisible) (true - selection visible)....
            toolbarOptions: ToolbarOptions(
              // ! [toolbarOptions] is where we give the option and in default it have the copy and selectAll option true....
              copy: true,
              cut: true,
              paste: true,
              selectAll: true,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("SelectableText"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day055_selectable_text.dart';
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
