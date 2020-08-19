import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day91ImplicitAnimations extends StatelessWidget {
  final List<Map<String, dynamic>> implicitAnimationsList = [
    {
      'title': 'AnimatedAlign',
      'icon': Icons.import_export,
      'content': 'which is an implicitly animated version of Align.',
      'page': new ExampleAnimatedAlign()
    },
    {
      'title': 'AnimatedContainer',
      'icon': Icons.crop_square,
      'content': 'which is an implicitly animated version of Container.',
      'page': new ExampleAnimatedContainer()
    },
    {
      'title': 'AnimatedDefaultTextStyle',
      'icon': Icons.text_fields,
      'content':
          'which is an implicitly animated version of DefaultTextStyle,.',
      'page': new ExampleAnimatedDefaultTextStyle()
    },
    {
      'title': 'AnimatedOpacity',
      'icon': Icons.blur_on,
      'content': 'which is an implicitly animated version of Opacity.',
      'page': new ExampleAnimatedOpacity()
    },
    {
      'title': 'AnimatedPadding',
      'icon': Icons.vertical_align_center,
      'content': 'which is an implicitly animated version of Padding.',
      'page': new ExampleAnimatedPadding()
    },
    {
      'title': 'AnimatedPhysicalModel',
      'icon': Icons.color_lens,
      'content': 'which is an implicitly animated version of PhysicalModel.',
      'page': new ExampleAnimatedPhysicalModel()
    },
    {
      'title': 'AnimatedPositioned',
      'icon': Icons.place,
      'content': 'which is an implicitly animated version of Positioned.',
      'page': new ExampleAnimatedPositioned()
    },
    {
      'title': 'AnimatedPositionedDirectional',
      'icon': Icons.directions,
      'content':
          'which is an implicitly animated version of PositionedDirectional.',
      'page': new ExampleAnimatedPositionedDirectional()
    },
    {
      'title': 'AnimatedCrossFade',
      'icon': Icons.blur_off,
      'content':
          ' which cross-fades between two given children and animates itself between their sizes.',
      'page': new ExampleAnimatedCrossFade()
    },
    {
      'title': 'AnimatedSize',
      'icon': Icons.photo_size_select_large,
      'content':
          'which automatically transitions its size over a given duration.',
      'page': new ExampleAnimatedSize()
    },
    {
      'title': 'AnimatedSwitcher',
      'icon': Icons.swap_horiz,
      'content': ' which fades from one widget to another.',
      'page': new ExampleAnimatedSwitcher()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: implicitAnimationsList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            trailing: Icon(implicitAnimationsList[index]['icon']),
            title: Text(implicitAnimationsList[index]['title']),
            subtitle: Text(implicitAnimationsList[index]['content']),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => implicitAnimationsList[index]['page'],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          thickness: 2,
        ),

      ),
      appBar: AppBar(
        title: Text('Implicit Animations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day091_implicit_animations.dart';
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

class ExampleAnimatedAlign extends StatefulWidget {
  @override
  _ExampleAnimatedAlignState createState() => _ExampleAnimatedAlignState();
}

class _ExampleAnimatedAlignState extends State<ExampleAnimatedAlign> {
  bool repeat;

  @override
  void initState() {
    super.initState();
    repeat = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedAlign",
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedAlign(
              curve: Curves.bounceInOut,
              alignment: repeat ? Alignment.topCenter : Alignment.bottomCenter,
              duration: Duration(seconds: 1),
              child: Text(
                "AnimatedAlign",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedContainer extends StatefulWidget {
  @override
  _ExampleAnimatedContainerState createState() =>
      _ExampleAnimatedContainerState();
}

class _ExampleAnimatedContainerState extends State<ExampleAnimatedContainer> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedContainer",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: 250,
              height: 250,
              alignment: repeat ? Alignment.topCenter : Alignment.bottomCenter,
              color: repeat ? Colors.deepPurple : Colors.deepOrange,
              transform: Matrix4.identity()..scale(repeat ? 0.5 : 1.0),
              child: Text(
                "AnimatedContainer",
                style: TextStyle(
                    fontSize: 20, color: repeat ? Colors.white : Colors.black),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedDefaultTextStyle extends StatefulWidget {
  @override
  _ExampleAnimatedDefaultTextStyleState createState() =>
      _ExampleAnimatedDefaultTextStyleState();
}

class _ExampleAnimatedDefaultTextStyleState
    extends State<ExampleAnimatedDefaultTextStyle> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedDefaultTextStyle",
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedDefaultTextStyle(
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              style: repeat
                  ? TextStyle(
                      fontSize: 10,
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.italic,
                    )
                  : TextStyle(
                      fontSize: 30,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
              child: Text("AnimatedDefaultTextStyle"),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedOpacity extends StatefulWidget {
  @override
  _ExampleAnimatedOpacityState createState() => _ExampleAnimatedOpacityState();
}

class _ExampleAnimatedOpacityState extends State<ExampleAnimatedOpacity> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedContainer",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: repeat ? 0.5 : 1.0,
              duration: Duration(seconds: 1),
              curve: Curves.decelerate,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.deepOrange,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedPadding extends StatefulWidget {
  @override
  _ExampleAnimatedPaddingState createState() => _ExampleAnimatedPaddingState();
}

class _ExampleAnimatedPaddingState extends State<ExampleAnimatedPadding> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedPadding",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.all(repeat ? 5.0 : 100.0),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.deepOrange,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedPhysicalModel extends StatefulWidget {
  @override
  _ExampleAnimatedPhysicalModelState createState() =>
      _ExampleAnimatedPhysicalModelState();
}

class _ExampleAnimatedPhysicalModelState
    extends State<ExampleAnimatedPhysicalModel> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedPhysicalModel",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPhysicalModel(
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 1),
              color: repeat ? Colors.deepOrange : Colors.deepPurple,
              shadowColor:
                  repeat ? Colors.deepPurpleAccent : Colors.deepOrangeAccent,
              shape: BoxShape.rectangle,
              elevation: repeat ? 25 : 50,
              animateColor: true,
              animateShadowColor: true,
              borderRadius: BorderRadius.circular(repeat ? 10 : 250),
              child: Container(
                width: 250,
                height: 250,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedPositioned extends StatefulWidget {
  @override
  _ExampleAnimatedPositionedState createState() =>
      _ExampleAnimatedPositionedState();
}

class _ExampleAnimatedPositionedState extends State<ExampleAnimatedPositioned> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedPhysicalModel",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              curve: Curves.easeInOutCirc,
              duration: Duration(seconds: 1),
              top: repeat ? 10 : 250,
              left: repeat ? 20 : 250,
              bottom: repeat ? 30 : 20,
              right: repeat ? 40 : 10,
              child: Container(
                color: Colors.deepOrange,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedPositionedDirectional extends StatefulWidget {
  @override
  _ExampleAnimatedPositionedDirectionalState createState() =>
      _ExampleAnimatedPositionedDirectionalState();
}

class _ExampleAnimatedPositionedDirectionalState
    extends State<ExampleAnimatedPositionedDirectional> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedPositionedDirectional",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositionedDirectional(
              curve: Curves.easeInOutCirc,
              duration: Duration(seconds: 1),
              start: repeat ? 50 : 10,
              end: repeat ? 50 : 10,
              top: repeat ? 250 : 10,
              bottom: repeat ? 250 : 10,
              child: Container(
                color: Colors.deepOrange,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedCrossFade extends StatefulWidget {
  @override
  _ExampleAnimatedCrossFadeState createState() =>
      _ExampleAnimatedCrossFadeState();
}

class _ExampleAnimatedCrossFadeState extends State<ExampleAnimatedCrossFade> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedPositionedDirectional",
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCrossFade(
              duration: Duration(seconds: 1),
              firstCurve: Curves.elasticInOut,
              secondCurve: Curves.elasticInOut,
              sizeCurve: Curves.elasticInOut,
              reverseDuration: Duration(seconds: 2),
              crossFadeState:
                  repeat ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container(
                width: 250,
                height: 250,
                color: Colors.deepOrange,
              ),
              secondChild: Image.asset('images/logo.png'),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedSize extends StatefulWidget {
  @override
  _ExampleAnimatedSizeState createState() => _ExampleAnimatedSizeState();
}

class _ExampleAnimatedSizeState extends State<ExampleAnimatedSize>
    with SingleTickerProviderStateMixin {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedSize",
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedSize(
              duration: Duration(seconds: 1),
              vsync: this,
              child: FlutterLogo(
                size: repeat ? 10 : 250,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAnimatedSwitcher extends StatefulWidget {
  @override
  _ExampleAnimatedSwitcherState createState() =>
      _ExampleAnimatedSwitcherState();
}

class _ExampleAnimatedSwitcherState extends State<ExampleAnimatedSwitcher> {
  bool repeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedSwitcher",
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(animation),
                child: child,
              ),
              reverseDuration: Duration(seconds: 3),
              child: Container(
                width: 250,
                height: 250,
                key: ValueKey<bool>(repeat),
                child: Stack(
                  children: [
                    repeat
                        ? Container(
                            width: 250,
                            height: 250,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
                        : Container(
                            width: 250,
                            height: 250,
                            color: Colors.deepPurple,
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Click Me!"),
                onPressed: () {
                  setState(() {
                    repeat = !repeat;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
