import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// ! InheritedModel is also same as the InheritedWidget...

/// ! here we use the keywords to get the particular model....

// ! here we have two test model of color....
class Model1 {
  Color color;
  Model1(this.color);
}

class Model2 {
  Color color;
  Model2(this.color);
}

// ! here we create the InheritedModel same as the InheritedWidget with the key as string....
class ModelInfo extends InheritedModel<String> {
  ModelInfo({Key key, this.child, this.model1, this.model2})
      : super(key: key, child: child);

  final Widget child;
  // ? here we added the model instance....
  final Model1 model1;
  final Model2 model2;

  static ModelInfo of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ModelInfo>());
  }

  @override
  bool updateShouldNotify(ModelInfo oldWidget) {
    return true;
  }

  @override
  bool updateShouldNotifyDependent(
      ModelInfo oldWidget, Set<String> dependencies) {
    /**
         * ! this function is same as the updateShouldNotify....
         * ! but here we can notify specify model seperately....
         */
    if (dependencies.contains("one") && oldWidget.model1 != model1) {
      // ! this condition will check for the key [one] in the of function...
      return true;
    } else if (dependencies.contains("two") && oldWidget.model2 != model2) {
      // ! this condition will check for the key [two] in the of function...
      return true;
    }
    return false;
  }
}

// * This is our root and calling Main Class of this file....
class Day37InheritedModel extends StatelessWidget {
  const Day37InheritedModel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelInfo(
      /**
       * ! this root build have the InheritedModel as the child...
       */
      model1: Model1(Colors.white), // init the model1....
      model2: Model2(Colors.black), // init the model2....
      child: HomePage(), // add the nextchild page....
    );
  }
}

// so that this home page can access the root value....
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ! by calling with the help of inheritFrom function as [aspect] "one"....
    final info =
        InheritedModel.inheritFrom<ModelInfo>(context, aspect: "one").model1;

    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedModel"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day037_inherited_model.dart';
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
        child: InkWell(
          onTap: () {
            setState(() {
              info.color =
                  info.color == Colors.purple ? Colors.white : Colors.purple;
            });
          },
          child: Container(
            color: info.color,
            child: Center(
              child: SubWidget(), // ! here we call the sub page....
            ),
          ),
        ),
      ),
    );
  }
}

// This sub page also can access the root value...
class SubWidget extends StatefulWidget {
  const SubWidget({Key key}) : super(key: key);

  @override
  _SubWidgetState createState() => _SubWidgetState();
}

class _SubWidgetState extends State<SubWidget> {
  @override
  Widget build(BuildContext context) {
    // ! by calling with the help of inheritFrom function as [aspect] "two"....
    final info =
        InheritedModel.inheritFrom<ModelInfo>(context, aspect: "two").model2;

    return InkWell(
      onTap: () {
        setState(() {
          info.color =
              info.color == Colors.black ? Colors.yellow : Colors.black;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        color: info.color,
      ),
    );
  }
}
