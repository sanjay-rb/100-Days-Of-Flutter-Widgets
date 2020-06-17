import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day17Hero extends StatefulWidget {
  Day17Hero({Key key}) : super(key: key);

  @override
  _Day17HeroState createState() => _Day17HeroState();
}

class _Day17HeroState extends State<Day17Hero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topRight,
        child: Hero(
          // ? What is Hero...
          /**
       * ! Hero is the very cool and simple animation effect for the Developer....
       * ! [tag] , [child] are the requried properties for the Hero....
       */
          tag: "laptop",
          /**
         * ! [tag] - is identifier tag for the Hero Element....
         */
          child:
              /**
         * ! [child] - is for hold the elemet=nt in the Ui....
         */
              GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NextPage(),
                )),
            child: Icon(
              Icons.laptop,
              size: 100.0,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Hero"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day017_hero.dart';
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

class NextPage extends StatefulWidget {
  NextPage({Key key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Hero(
            tag:
                "laptop", // ! we have to main the same identifier [tag] here so that the animation is cool....
            child: Icon(
              Icons.laptop,
              size: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
