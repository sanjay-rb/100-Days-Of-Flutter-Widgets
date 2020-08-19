import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day93BuiltInExplicitAnimations extends StatelessWidget {
  final List<Map<String, dynamic>> builtInExplicitAnimationsList = [
    {
      'title': 'AlignTransition',
      'icon': Icons.vertical_align_center,
      'content': 'which is an animated version of [Align].',
      'page': new ExampleAlignTransition()
    },
    {
      'title': 'DecoratedBoxTransition',
      'icon': Icons.crop_square,
      'content': 'which is an animated version of [DecoratedBox].',
      'page': new ExampleDecoratedBoxTransition()
    },
    {
      'title': 'DefaultTextStyleTransition',
      'icon': Icons.text_fields,
      'content': 'which is an animated version of [DefaultTextStyle].',
      'page': new ExampleDefaultTextStyleTransition()
    },
    {
      'title': 'PositionedTransition',
      'icon': Icons.place,
      'content': 'which is an animated version of [Positioned].',
      'page': new ExamplePositionedTransition()
    },
    {
      'title': 'RotationTransition',
      'icon': Icons.refresh,
      'content': 'which animates the rotation of a widget.',
      'page': new ExampleRotationTransition()
    },
    {
      'title': 'ScaleTransition',
      'icon': Icons.transform,
      'content': 'which animates the scale of a widget.',
      'page': new ExampleScaleTransition()
    },
    {
      'title': 'SizeTransition',
      'icon': Icons.photo_size_select_large,
      'content': 'which animates its own size.',
      'page': new ExampleSizeTransition()
    },
    {
      'title': 'SlideTransition',
      'icon': Icons.slideshow,
      'content':
          'which animates the position of a widget relative to its normal position.',
      'page': new ExampleSlideTransition()
    },
    {
      'title': 'FadeTransition',
      'icon': Icons.blur_on,
      'content': 'which is an animated version of [Opacity].',
      'page': new ExampleFadeTransition()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Built-in Explicit Animations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day093_built_in_explicit_animations.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: builtInExplicitAnimationsList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            trailing: Icon(builtInExplicitAnimationsList[index]['icon']),
            title: Text(builtInExplicitAnimationsList[index]['title']),
            subtitle: Text(builtInExplicitAnimationsList[index]['content']),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    builtInExplicitAnimationsList[index]['page'],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          thickness: 2,
        ),
      ),
    );
  }
}

class ExampleAlignTransition extends StatefulWidget {
  @override
  _ExampleAlignTransitionState createState() => _ExampleAlignTransitionState();
}

class _ExampleAlignTransitionState extends State<ExampleAlignTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final AlignmentTween _alignmentTween =
      AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('AlignTransition'),
        ),
        body: AlignTransition(
          alignment: _alignmentTween.animate(_controller),
          child: Container(
            width: 250,
            height: 250,
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}

class ExampleDecoratedBoxTransition extends StatefulWidget {
  @override
  _ExampleDecoratedBoxTransitionState createState() =>
      _ExampleDecoratedBoxTransitionState();
}

class _ExampleDecoratedBoxTransitionState
    extends State<ExampleDecoratedBoxTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      gradient: LinearGradient(colors: [Colors.deepOrange, Colors.deepPurple]),
      borderRadius: BorderRadius.circular(250),
    ),
    end: BoxDecoration(
      gradient: LinearGradient(colors: [Colors.deepPurple, Colors.deepOrange]),
      borderRadius: BorderRadius.circular(50),
    ),
  );

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('DecoratedBoxTransition'),
        ),
        body: Center(
          child: DecoratedBoxTransition(
            decoration: _decorationTween.animate(_controller),
            child: Container(
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleDefaultTextStyleTransition extends StatefulWidget {
  @override
  _ExampleDefaultTextStyleTransitionState createState() =>
      _ExampleDefaultTextStyleTransitionState();
}

class _ExampleDefaultTextStyleTransitionState
    extends State<ExampleDefaultTextStyleTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final TextStyleTween _textStyleTween = TextStyleTween(
    begin: TextStyle(
      fontSize: 5,
      decoration: TextDecoration.overline,
      letterSpacing: 20,
      color: Colors.deepOrange,
    ),
    end: TextStyle(
      fontSize: 20,
      decoration: TextDecoration.underline,
      letterSpacing: 1,
      color: Colors.deepPurple,
    ),
  );

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('DefaultTextStyleTransition'),
        ),
        body: Center(
          child: DefaultTextStyleTransition(
            maxLines: 10,
            style: _textStyleTween.animate(_controller),
            textAlign: TextAlign.center,
            child: Text(
                "Hi this is Sanjay This is 93th Day of 100 Days of Flutter!"),
          ),
        ),
      ),
    );
  }
}

class ExamplePositionedTransition extends StatefulWidget {
  @override
  _ExamplePositionedTransitionState createState() =>
      _ExamplePositionedTransitionState();
}

class _ExamplePositionedTransitionState
    extends State<ExamplePositionedTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fill,
    end: RelativeRect.fromLTRB(50, 100, 50, 100),
  );

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('PositionedTransition'),
        ),
        body: Stack(
          children: [
            PositionedTransition(
              rect: _relativeRectTween.animate(_controller),
              child: Container(
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleRotationTransition extends StatefulWidget {
  @override
  _ExampleRotationTransitionState createState() =>
      _ExampleRotationTransitionState();
}

class _ExampleRotationTransitionState extends State<ExampleRotationTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('RotationTransition'),
        ),
        body: Center(
          child: RotationTransition(
            turns: _controller,
            child: FlutterLogo(
              size: 250,
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleScaleTransition extends StatefulWidget {
  @override
  _ExampleScaleTransitionState createState() => _ExampleScaleTransitionState();
}

class _ExampleScaleTransitionState extends State<ExampleScaleTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScaleTransition'),
        ),
        body: Center(
          child: ScaleTransition(
            scale: _controller,
            child: FlutterLogo(
              size: 250,
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleSizeTransition extends StatefulWidget {
  @override
  _ExampleSizeTransitionState createState() => _ExampleSizeTransitionState();
}

class _ExampleSizeTransitionState extends State<ExampleSizeTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('SizeTransition'),
        ),
        body: Center(
          child: SizeTransition(
            axis: Axis.vertical,
            sizeFactor: _controller,
            child: FlutterLogo(
              size: 250,
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleSlideTransition extends StatefulWidget {
  @override
  _ExampleSlideTransitionState createState() => _ExampleSlideTransitionState();
}

class _ExampleSlideTransitionState extends State<ExampleSlideTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final Tween<Offset> _offsetTween = Tween(
    begin: Offset.zero,
    end: const Offset(-1, 0),
  );

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('SizeTransition'),
        ),
        body: Center(
          child: SlideTransition(
            position: _offsetTween.animate(_controller),
            child: FlutterLogo(
              size: 250,
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleFadeTransition extends StatefulWidget {
  @override
  _ExampleFadeTransitionState createState() => _ExampleFadeTransitionState();
}

class _ExampleFadeTransitionState extends State<ExampleFadeTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('FadeTransition'),
        ),
        body: Center(
          child: FadeTransition(
            opacity: _controller,
            child: FlutterLogo(
              size: 250,
            ),
          ),
        ),
      ),
    );
  }
}
