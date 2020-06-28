import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day41RichText extends StatefulWidget {
  const Day41RichText({Key key}) : super(key: key);

  @override
  _Day41RichTextState createState() => _Day41RichTextState();
}

class _Day41RichTextState extends State<Day41RichText> {
  var _text = "Sanjay ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            /**
           * ? What is RichText....
           * ! RichText is the higher version of the Text widget....
           * ! that is nothing but the,
           * ! we can specify the text style for the specific part of the text....
           */
            child: RichText(
                maxLines:
                    2, // ! here we can specify the max lines of the paragraph....
                overflow: TextOverflow
                    .fade, // ! if any overflow text it will be faded out....
                softWrap:
                    false, // ? Whether the text should break at soft line breaks....
                textAlign: TextAlign.end, // ! alignment of the para....
                textDirection:
                    TextDirection.ltr, // ! direction of the whole para...
                textScaleFactor: 1, // ! size factor of the text....

                /**
               * ! here comes the text property .....
               * ! text property actually holds the InlineSpan....
               * ! we can give the TextSpan as the Input....
               */
                text: TextSpan(
                  style: TextStyle(
                      color: Colors
                          .black), // ! we can specify the all text style here....
                  children: [
                    /**
                     * ! so each children can have its own style....
                     */
                    TextSpan(
                        text: "Hello ",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: "World! ",
                        style:
                            TextStyle(color: Colors.teal[900], fontSize: 25)),
                    TextSpan(text: "This is "),
                    TextSpan(
                      text: _text,
                      // ! with the help of recognizer we can perform the GestureRecognization....
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _text = _text == "Sanjay " ? "Master " : "Sanjay ";
                          });
                        },
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.deepPurple[900],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: "R B ",
                        // ! with the help of semanticsLabel we can give the Lables ot the Text....
                        /**
                         * ! example : TextSpan(text: r'$$', semanticsLabel: 'Double dollars')....
                         */
                        semanticsLabel: "Inital",
                        style: TextStyle(
                            color: Colors.deepOrange[900],
                            fontSize: 30,
                            fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: "\nReciprocal of the Evil is Live!",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("RichText"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day041_richtext.dart';
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
