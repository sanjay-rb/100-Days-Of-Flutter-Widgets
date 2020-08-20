import 'package:flutter/material.dart';
import 'package:hundreddaysofflutterwidget/day027_animated_builder.dart';
import 'package:hundreddaysofflutterwidget/day079_animated_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Day94CustomExplicitAnimations extends StatelessWidget {
  const Day94CustomExplicitAnimations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                trailing: Icon(Icons.filter_1),
                title: Text('AnimatedBuilder'),
                subtitle: Text(
                    'A general-purpose widget for building animations.\nAnimatedBuilder is useful for more complex widgets that wish to include an animation as part of a larger build function. To use AnimatedBuilder, simply construct the widget and pass it a builder function.'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Day27AnimatedBuilder(),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                trailing: Icon(Icons.filter_1),
                title: Text('AnimatedWidget'),
                subtitle: Text(
                    'A widget that rebuilds when the given Listenable changes value.\nAnimatedWidget is most commonly used with Animation objects, which are Listenable, but it can be used with any Listenable, including ChangeNotifier and ValueNotifier.'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Day79AnimatedWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Custom Explicit Animations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day094_custom_explicit_animations.dart';
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
