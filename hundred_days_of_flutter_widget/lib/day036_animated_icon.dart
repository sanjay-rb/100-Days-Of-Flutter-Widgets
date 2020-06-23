import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day36AnimatedIcon extends StatefulWidget {
  @override
  _Day36AnimatedIconState createState() => _Day36AnimatedIconState();
}

class _Day36AnimatedIconState extends State<Day36AnimatedIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animIcon;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animIcon = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              verticalDirection: VerticalDirection.down,
              runAlignment: WrapAlignment.center,
              runSpacing: 10,
              spacing: 10,
              children: <Widget>[
                // ! I have added all the animIcons in the Column....
                AnimatedIcon(
                  // ?What is AnimatedIcon....
                  /**
                 * ! AnimatedIcon is the cool animations on the icons like play and pause....
                 * ! we can perform the animation with the help of AnimatedIcon....
                 * ! it requried two important property...
                 * ! [icon] and [progress]
                 */
                  icon: AnimatedIcons
                      .add_event, // ? [icon] holds the AnimatedIcons of 14 types....
                  progress:
                      animIcon, // ? [progress] holds the Animated<Double> value....
                  size: 100, // ! yes, we can provide the size....
                  color: Colors.lightGreen, // ! and color too....
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: animIcon,
                  size: 100,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: animIcon,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.ellipsis_search,
                  progress: animIcon,
                  size: 100,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.event_add,
                  progress: animIcon,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.home_menu,
                  progress: animIcon,
                  size: 100,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.list_view,
                  progress: animIcon,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: animIcon,
                  size: 100,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: animIcon,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.menu_home,
                  progress: animIcon,
                  size: 100,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.pause_play,
                  progress: animIcon,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: animIcon,
                  size: 100,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.search_ellipsis,
                  progress: animIcon,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                AnimatedIcon(
                  icon: AnimatedIcons.view_list,
                  progress: animIcon,
                  size: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("AnimatedIcon"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day036_animated_icon.dart';
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
