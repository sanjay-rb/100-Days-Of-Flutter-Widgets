import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InheritedColorWidget extends StatefulWidget {
  /// ! create the simple StatefulWidget which is going to be the InheritedWidget....

  /// ! and going to be the Top|Root of Widget tree....

  InheritedColorWidget({Key key, this.child}) : super(key: key);

  final Widget child; // ? All the child are comes in the child....

  @override
  InheritedColorWidgetState createState() => InheritedColorWidgetState();

  static InheritedColorWidgetState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<InheritedColorData>()).data;
  /**
   * ! [of] is used to get the Instance of the [InheritedColorData] for the help of [InheritedColorWidget]....
   */
}

class InheritedColorWidgetState extends State<InheritedColorWidget> {
  Color color = Colors
      .red; // ? This Color data is going to be share between the child Widgets....

  void changeColor() {
    // ! a simple toggle function for play with color....
    if (color == Colors.red) {
      setState(() {
        color = Colors.green;
      });
    } else {
      setState(() {
        color = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedColorData(child: widget.child, data: this);
  }
}

class InheritedColorData extends InheritedWidget {
  // ? Here comes the [InheritedWidget] oops [InheritedData]
  // ? What is InheritedWidget....
  /// ! InheritedWidget is the very important class in the Flutter...

  /// ! This act as the root top Widget of all the child widget...

  /// ! and provide the [data] for all the below child widget....

  /// ! Actually InheritedWidget not the normal UI Widget it have simple save and share the data....

  InheritedColorData({Key key, @required Widget child, @required this.data})
      : super(key: key, child: child);

  final InheritedColorWidgetState
      data; // ! this is the instance of InheritedColorWidgetState going to be share color property....

  @override
  bool updateShouldNotify(InheritedColorData oldWidget) {
    return true;
  }
}

class Day15InheritedWidget extends StatefulWidget {
  Day15InheritedWidget({Key key}) : super(key: key);

  @override
  _Day15InheritedWidgetState createState() => _Day15InheritedWidgetState();
}

class _Day15InheritedWidgetState extends State<Day15InheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InheritedColorWidget(
        // ! here we added the InheritedWidget....
        child: Container(
          child:
              NewChildWidget(), // ! we are going to create the nested ChildWidget....
        ),
      ),
      appBar: AppBar(
        title: Text("InheritedWidget"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
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
    );
  }
}

class NewChildWidget extends StatelessWidget {
  // ! NewChild....
  const NewChildWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InheritedColorWidgetState state = InheritedColorWidget.of(
        context); // ! here we use the [of] function from the InheritedColorWidget to get the InheritedColorData....
    return GestureDetector(
      onTap: () {
        state
            .changeColor(); // ! on tap the InheritedColorWidgetState.changeColor() will call....
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: state
            .color, // ! the set state of the InheritedColorWidgetState will change the state of NewChildWidget too....
      ),
    );
  }
}
