import 'package:flutter/material.dart';

import 'package:hundreddaysofflutterwidget/day001_safearea.dart';
import 'package:hundreddaysofflutterwidget/day002_expanded.dart';
import 'package:hundreddaysofflutterwidget/day003_wrap.dart';
import 'package:hundreddaysofflutterwidget/day004_animation_container.dart';
import 'package:hundreddaysofflutterwidget/day005_opacity.dart';
import 'package:hundreddaysofflutterwidget/day006_future_builder.dart';
import 'package:hundreddaysofflutterwidget/day007_fade_transition.dart';
import 'package:hundreddaysofflutterwidget/day008_floating_action_btn.dart';
import 'package:hundreddaysofflutterwidget/day009_page_view.dart';
import 'package:hundreddaysofflutterwidget/day010_table.dart';
import 'package:hundreddaysofflutterwidget/day011_sliver_appbar.dart';
import 'package:hundreddaysofflutterwidget/day012_slivergrid_list.dart';
import 'package:hundreddaysofflutterwidget/day013_fadein_image.dart';
import 'package:hundreddaysofflutterwidget/day014_stream_builder.dart';
import 'package:hundreddaysofflutterwidget/day015_inherited_widget.dart';
import 'package:hundreddaysofflutterwidget/day016_cliprrect.dart';
import 'package:hundreddaysofflutterwidget/day017_hero.dart';
import 'package:hundreddaysofflutterwidget/day018_custompaint.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hundred Days Of Flutter Widget',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Day18CustomPaint(),
      ),
    );
  }
}

