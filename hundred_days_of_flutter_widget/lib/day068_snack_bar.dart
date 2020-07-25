import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day68SnackBar extends StatefulWidget {
  Day68SnackBar({Key key}) : super(key: key);

  @override
  _Day68SnackBarState createState() => _Day68SnackBarState();
}

class _Day68SnackBarState extends State<Day68SnackBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Color _bgColor = Colors.pinkAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      key: _scaffoldKey,
      body: Center(
        child: RaisedButton(
          child: Text("show SnackBar!"),
          /**
           * ? What is SnackBar....
           * ! SnackBar is the simple popup widget in flutter.....
           * ! we can acll the snackbar from the scafold....
           */
          onPressed: () => _scaffoldKey.currentState.showSnackBar(
            // * here we call the SnackBar....
            SnackBar(
              // ! here comes the SnackBar....
              content: Image.asset(
                  "images/coffee.jpg"), // ! We can fix any widget here aas the [content]....
              /**
               * ! [behavior] is depends on two type....
               * [floating] normal toast in android....
               * [fixed] is fixed to the bottom of the screen....
               */
              behavior: SnackBarBehavior.fixed,
              duration: Duration(seconds: 2), // ! Default 4 seconds....
              elevation: 10, // ! Default 10....
              onVisible: () => print(
                  "SnackBar Visible"), // ! this [onVisible] callback functon will call on every visible state of SnackBar....
              backgroundColor: Colors
                  .black38, // ! we can give any bg Color her for SnackBar....
              action: SnackBarAction(
                // ! [action] takes the [SnackBarAction] for button event....
                label: "Ok", // ! Text on the default flatButton....
                textColor: Colors.white, // ! Color of Text....
                onPressed: () {
                  // ! Event Call Back of the ActionButton....
                  setState(() {
                    _bgColor = _bgColor == Colors.pinkAccent
                        ? Colors.deepOrange
                        : Colors.pinkAccent;
                  });
                },
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("SnackBar"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day068_snack_bar.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}
