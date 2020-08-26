import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hundreddaysofflutterwidget/route/route.dart';
import 'package:hundreddaysofflutterwidget/string_data/string_data.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class WebApp extends StatefulWidget {
  WebApp({Key key}) : super(key: key);

  @override
  _WebAppState createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => WebAppDesktop(),
      tablet: (_) => WebAppTablet(),
      mobile: (_) => WebAppMobile(),
    );
  }
}

class WebAppDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        final deviceWidth = sizingInformation.screenSize.width;
        final deviceHeight = sizingInformation.screenSize.height;

        Size headingBox = Size(deviceWidth * 0.4, deviceWidth * 0.4);
        Size menuBox = Size(deviceWidth * 0.1, deviceWidth * 0.1);
        Size docsBox = Size(deviceWidth * 0.15, deviceWidth * 0.15);

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueGrey[100],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: deviceWidth,
                  height: deviceHeight,
                  child: Stack(
                    children: [
                      Center(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Container(
                                color: Colors.white,
                                width: headingBox.width,
                                height: headingBox.height,
                                child: Center(
                                  child: Text('100 Days of Flutter Widgets',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(color: Colors.black)),
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              delay: Duration.zero,
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  menuBox.width * -0.5,
                                  menuBox.height * -0.3,
                                ),
                                child: Container(
                                  color: Colors.black,
                                  width: menuBox.width,
                                  height: menuBox.height,
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: menuBox.width * 0.5,
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 2),
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  headingBox.width - docsBox.width * 0.5,
                                  headingBox.height - docsBox.height * 0.80,
                                ),
                                child: Container(
                                  color: Colors.black,
                                  width: docsBox.width,
                                  height: docsBox.height,
                                  child: Icon(
                                    Icons.code,
                                    color: Colors.white,
                                    size: menuBox.width * 0.8,
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 3),
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.arrow_downward,
                            size: menuBox.width * 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              expandedHeight: deviceHeight,
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: List.generate(routes.length, (index) {
                Size headingBox = Size(200, 200);
                Size menuBox = Size(50, 50);
                Size docsBox = Size(100, 100);
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, routes[index]['route']);
                            },
                            child: Container(
                              color: Colors.white,
                              width: headingBox.width,
                              height: headingBox.height,
                              child: Center(
                                child: Text(
                                  routes[index]['name'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (await canLaunch(
                                  StringData.gitURL + routes[index]['file'])) {
                                await launch(
                                    StringData.gitURL + routes[index]['file']);
                              } else {
                                throw 'Could not launch ${StringData.gitURL + routes[index]['file']}';
                              }
                            },
                            child: Transform.translate(
                              offset: Offset(
                                menuBox.width * -0.5,
                                menuBox.height * -0.3,
                              ),
                              child: Container(
                                color: Colors.black,
                                width: menuBox.width,
                                height: menuBox.height,
                                child: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                  size: menuBox.width * 0.5,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, routes[index]['route']);
                            },
                            child: Transform.translate(
                              offset: Offset(
                                headingBox.width - docsBox.width * 0.5,
                                headingBox.height - docsBox.height * 0.80,
                              ),
                              child: Container(
                                  color: Colors.black,
                                  width: docsBox.width,
                                  height: docsBox.height,
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ],
        );
      }),
    );
  }
}

class WebAppTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        final deviceWidth = sizingInformation.screenSize.width;
        final deviceHeight = sizingInformation.screenSize.height;

        Size headingBox = Size(deviceWidth * 0.4, deviceWidth * 0.4);
        Size menuBox = Size(deviceWidth * 0.1, deviceWidth * 0.1);
        Size docsBox = Size(deviceWidth * 0.15, deviceWidth * 0.15);

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueGrey[100],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: deviceWidth,
                  height: deviceHeight,
                  child: Stack(
                    children: [
                      Center(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Container(
                                color: Colors.white,
                                width: headingBox.width,
                                height: headingBox.height,
                                child: Center(
                                  child: Text(
                                    '100 Days of Flutter Widgets',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              delay: Duration.zero,
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  menuBox.width * -0.5,
                                  menuBox.height * -0.3,
                                ),
                                child: Builder(
                                  builder: (context) => GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Container(
                                      color: Colors.black,
                                      width: menuBox.width,
                                      height: menuBox.height,
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                        size: menuBox.width * 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 2),
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  headingBox.width - docsBox.width * 0.5,
                                  headingBox.height - docsBox.height * 0.80,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    const url =
                                        'https://sanjaysanju618.github.io/100-Days-Of-Flutter-Widgets/';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Container(
                                    color: Colors.black,
                                    width: docsBox.width,
                                    height: docsBox.height,
                                    child: Icon(
                                      Icons.code,
                                      color: Colors.white,
                                      size: menuBox.width * 0.8,
                                    ),
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 3),
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.arrow_downward,
                            size: menuBox.width * 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              expandedHeight: deviceHeight,
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: List.generate(routes.length, (index) {
                Size headingBox = Size(150, 150);
                Size menuBox = Size(25, 25);
                Size docsBox = Size(50, 50);
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, routes[index]['route']);
                            },
                            child: Container(
                              color: Colors.white,
                              width: headingBox.width,
                              height: headingBox.height,
                              child: Center(
                                child: Text(
                                  routes[index]['name'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (await canLaunch(
                                  StringData.gitURL + routes[index]['file'])) {
                                await launch(
                                    StringData.gitURL + routes[index]['file']);
                              } else {
                                throw 'Could not launch ${StringData.gitURL + routes[index]['file']}';
                              }
                            },
                            child: Transform.translate(
                              offset: Offset(
                                menuBox.width * -0.5,
                                menuBox.height * -0.3,
                              ),
                              child: Container(
                                color: Colors.black,
                                width: menuBox.width,
                                height: menuBox.height,
                                child: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                  size: menuBox.width * 0.5,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, routes[index]['route']);
                            },
                            child: Transform.translate(
                              offset: Offset(
                                headingBox.width - docsBox.width * 0.5,
                                headingBox.height - docsBox.height * 0.80,
                              ),
                              child: Container(
                                  color: Colors.black,
                                  width: docsBox.width,
                                  height: docsBox.height,
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ],
        );
      }),
    );
  }
}

class WebAppMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        final deviceWidth = sizingInformation.screenSize.width;
        final deviceHeight = sizingInformation.screenSize.height;

        Size headingBox = Size(deviceWidth * 0.5, deviceWidth * 0.5);
        Size menuBox = Size(deviceWidth * 0.1, deviceWidth * 0.1);
        Size docsBox = Size(deviceWidth * 0.15, deviceWidth * 0.15);

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueGrey[100],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: deviceWidth,
                  height: deviceHeight,
                  child: Stack(
                    children: [
                      Center(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Container(
                                color: Colors.white,
                                width: headingBox.width,
                                height: headingBox.height,
                                child: Center(
                                  child: Text(
                                    '100 Days of Flutter Widgets',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              delay: Duration.zero,
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  menuBox.width * -0.5,
                                  menuBox.height * -0.3,
                                ),
                                child: Container(
                                  color: Colors.black,
                                  width: menuBox.width,
                                  height: menuBox.height,
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: menuBox.width * 0.5,
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 2),
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                            PlayAnimation(
                              tween: Tween(begin: 0.0, end: 1.0),
                              child: Transform.translate(
                                offset: Offset(
                                  headingBox.width - docsBox.width * 0.5,
                                  headingBox.height - docsBox.height * 0.80,
                                ),
                                child: Container(
                                  color: Colors.black,
                                  width: docsBox.width,
                                  height: docsBox.height,
                                  child: Icon(
                                    Icons.code,
                                    color: Colors.white,
                                    size: menuBox.width * 0.8,
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 3),
                              builder: (context, child, value) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.arrow_downward,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              expandedHeight: deviceHeight,
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: List.generate(routes.length, (index) {
                Size headingBox = Size(100, 100);
                Size menuBox = Size(25, 25);
                Size docsBox = Size(40, 40);
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, routes[index]['route']);
                            },
                            child: Container(
                              color: Colors.white,
                              width: headingBox.width,
                              height: headingBox.height,
                              child: Center(
                                child: Text(
                                  routes[index]['name'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (await canLaunch(
                                  StringData.gitURL + routes[index]['file'])) {
                                await launch(
                                    StringData.gitURL + routes[index]['file']);
                              } else {
                                throw 'Could not launch ${StringData.gitURL + routes[index]['file']}';
                              }
                            },
                            child: Transform.translate(
                              offset: Offset(
                                menuBox.width * -0.5,
                                menuBox.height * -0.3,
                              ),
                              child: Container(
                                color: Colors.black,
                                width: menuBox.width,
                                height: menuBox.height,
                                child: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                  size: menuBox.width * 0.5,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, routes[index]['route']);
                            },
                            child: Transform.translate(
                              offset: Offset(
                                headingBox.width - docsBox.width * 0.5,
                                headingBox.height - docsBox.height * 0.80,
                              ),
                              child: Container(
                                  color: Colors.black,
                                  width: docsBox.width,
                                  height: docsBox.height,
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ],
        );
      }),
    );
  }
}
