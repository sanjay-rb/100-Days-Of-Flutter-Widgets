import 'package:flutter/material.dart';


import 'day001_safearea.dart';
import 'day002_expanded.dart';
import 'day003_wrap.dart';
import 'day004_animation_container.dart';
import 'day005_opacity.dart';
import 'day006_future_builder.dart';
import 'day007_fade_transition.dart';
import 'day008_floating_action_btn.dart';
import 'day009_page_view.dart';

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
        child: Day9PageView(),
      ),
    );
  }
}

