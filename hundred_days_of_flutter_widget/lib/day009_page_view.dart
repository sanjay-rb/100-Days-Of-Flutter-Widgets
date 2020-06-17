import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class Day9PageView extends StatefulWidget {
  Day9PageView({Key key}) : super(key: key);

  @override
  _Day9PageViewState createState() => _Day9PageViewState();
}

class _Day9PageViewState extends State<Day9PageView> {
  PageController _controller; // ? What is PageController....

  @override
  void initState() {
    _controller =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    /**
     * ! PageController contoll the pages and its states....
     * ! [initialPage] carry the starting page index starting from 0 to n....
     * ! [keepPage] hold the boolean values to store the paga data and states.... 
     * * true - save the Widgets data...
     * * false - regenerate the Widgets data...
     * ! [viewportFraction] is the fraction value here we fix the occupation of page in screen....
     */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool _isVertical = false; // ! play here to change direction....

    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day009_page_view.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: PageView(
          // ? What is PageView....
          /**
           * ! we can provide the sequence of pages and give the swipe actions.... 
           * ! [controller] carries the PageController....
           * ! [scrollDirection] carries the direction of swipe....
           * ! [children] holds the list of the Widgets list....
           */
          controller: _controller,
          scrollDirection: _isVertical ? Axis.vertical : Axis.horizontal,
          children: <Widget>[
            pageCreator(1),
            pageCreator(2),
            pageCreator(3),
            pageCreator(4),
            pageCreator(5),
          ],
        ),
      ),
    );
  }

  pageCreator(int i) {
    List<MaterialColor> _colors = [
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.brown
    ];
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 250,
          height: 250,
          color: _colors[i - 1],
          child: Center(
            child: Text("Page No $i"),
          ),
        ),
      ),
    );
  }
}
