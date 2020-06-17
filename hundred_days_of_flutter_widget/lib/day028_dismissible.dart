import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day28Dismissible extends StatefulWidget {
  Day28Dismissible({Key key}) : super(key: key);

  @override
  _Day28DismissibleState createState() => _Day28DismissibleState();
}

class _Day28DismissibleState extends State<Day28Dismissible> {
  final family = [
    "Janarthanan",
    "Saratha",
    "Babu",
    "Yanuma",
    "Sanjay",
    "Sharika",
    "Rajus",
    "Jothi",
    "SriSanth",
    "Niki",
    "Ramu",
    "Gayathri",
    "Humsi",
    "Hari"
  ]; // ? This is the Family list....
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day028_dismissible.dart';
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
        child: ListView.builder(
          // ! Creating the List view....
          itemCount: family.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              // ? What is Dismissible....
              /**
               * ! Dismissible is the cool flutter widget which delete the Widget via swipe....
               * ! yes, it requried 2 properties [key], [child]....
               */
              key: Key(family[
                  index]), // ! it required unique key to perfrom the effect or dismissal....
              child: ListTile(
                // ! this is the place where dismissal is going to be happen....
                title: Text(family[index]),
              ),
              background: Container(
                // ! this the background effect given to the dismissal (primary driection) ....
                color: Colors.green,
                child: Icon(Icons.add),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 25),
              ),
              secondaryBackground: Container(
                // ! this the background effect given to the dismissal (secondary driection) ....
                color: Colors.red,
                child: Icon(Icons.remove),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 25),
              ),
              onDismissed: (direction) {
                // ! this is where we can control the dismiss actions with the help of parameter direction....
                setState(() {
                  family.removeAt(
                      index); // ! I am set the state to the updated list....
                });
                direction ==
                        DismissDirection
                            .startToEnd // ! If the Dimiss Direction is left or right then green or red....
                    ? Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Member ${family[index]} Dismissed by Green")))
                    : Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Member ${family[index]} Dismissed by Red")));
              },
              direction: DismissDirection.horizontal,
              /**
               * ! we can give then swpie direction like:-
               * * horizontal,
               * * vertical,
               * * up,
               * * downm
               * * startToEnd,
               * * endToStart
               */
              movementDuration: Duration(
                  seconds:
                      2), // ? this is the time duration for the moment and the motion while restore to normal....
              resizeDuration: Duration(
                  seconds:
                      2), // ? this is the time duration for the dismissal and the fill the size....
            );
          },
        ),
      ),
    );
  }
}
