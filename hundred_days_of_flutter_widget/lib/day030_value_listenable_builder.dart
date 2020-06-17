import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day30ValueListenableBuilder extends StatefulWidget {
  Day30ValueListenableBuilder({Key key}) : super(key: key);

  @override
  _Day30ValueListenableBuilderState createState() =>
      _Day30ValueListenableBuilderState();
}

class _Day30ValueListenableBuilderState
    extends State<Day30ValueListenableBuilder> {
  final ValueNotifier<int> count = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: ValueListenableBuilder(
          // ? What is ValueListenableBuilder....
          /**
           * ! It is the real time update method on the flutter run update the value in all the widget tree....
           * ! It requried two properties valueListenable, builder....
           */
          valueListenable: count,
          /**
           * ! it accept the ValueNotifier as the value....
           * ! and check for the update....
           */
          builder: (context, value, child) {
            /**
             * ! builder is the place where the actual ui is going to be....
             * ! it will have 3 parameters context, value, child...
             * ! value have the current value for the child....
             */
            return Container(
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("topLeft : $value")),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text("topCenter : $value")),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text("topRight : $value")),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("centerLeft : $value")),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /**
                           * ! here we change the value from the notifier....
                           * ! it should update in all the places....
                           */
                          RaisedButton(
                            onPressed: () => count.value += 1,
                            child: Text("Click to Increment"),
                          ),
                          RaisedButton(
                            onPressed: () => count.value -= 1,
                            child: Text("Click to Decrement"),
                          )
                        ],
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("centerRight : $value")),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("bottomLeft : $value")),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("bottomCenter : $value")),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text("bottomRight : $value")),
                ],
              ),
            );
          },
        ),
      )),
      appBar: AppBar(
        title: Text("ValueListenableBuilder"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day030_value_listenable_builder.dart';
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
