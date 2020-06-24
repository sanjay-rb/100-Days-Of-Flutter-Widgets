import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Model {
  // ? initially we are define the value....
  Color color;
  Model(this.color);

  changeColor() {
    this.color = this.color == Colors.pink ? Colors.lightGreen : Colors.pink;
  }
}

class ModelInfo extends InheritedWidget {
  // ! here we add the InheritedWidget....
  ModelInfo({Key key, this.child, this.model}) : super(key: key, child: child);

  final Widget child;
  final Model model; // ! Adding the value instance InheritedWidget....

  static ModelInfo of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ModelInfo>());
  }

  @override
  bool updateShouldNotify(ModelInfo oldWidget) {
    return true;
  }
}

class Day37InheritedWidget extends StatelessWidget {
  const Day37InheritedWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelInfo(
      // ? Here we used the InheritedWidget....
      model: Model(Colors.pink), // ? we are given the root value to the top....
      child: HomePage(), // ! and we provide the child....
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            tooltip: "Day 37 - Update",
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/inherited_widget/day037_inherited_widget.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.help),
            tooltip: "Day 15 - Old",
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/inherited_widget/day015_inherited_widget.dart';
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
        child: GestureDetector(
          onTap: () {
            print("Click");
            setState(() {
              ModelInfo.of(context).model.changeColor(); // ! here we change the color in statefull widget....
            });
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SubWidget(), // ? here add the new Widget....
            ),
          ),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info = ModelInfo.of(context)
        .model; // ! look here we get the root value from the of funtion of InheritedWidget....
    return Container(
      width: 250,
      height: 250,
      color: info.color, // ! with that we use the color....
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "* This have two type code.... \n\n* check out both the help option.... \n\n* Press and hold for tip....",
          style: TextStyle(color: Colors.white, fontSize: 15),
        )),
      ),
    );
  }
}
