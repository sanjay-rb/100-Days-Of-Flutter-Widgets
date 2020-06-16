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
import 'package:hundreddaysofflutterwidget/day019_tooltip.dart';
import 'package:hundreddaysofflutterwidget/day020_fittedbox.dart';
import 'package:hundreddaysofflutterwidget/day021_layout_builder.dart';
import 'package:hundreddaysofflutterwidget/day022_absorb_pointer.dart';
import 'package:hundreddaysofflutterwidget/day023_transform.dart';
import 'package:hundreddaysofflutterwidget/day024_backdropfilter.dart';
import 'package:hundreddaysofflutterwidget/day025_align.dart';
import 'package:hundreddaysofflutterwidget/day026_positioned.dart';
import 'package:hundreddaysofflutterwidget/day027_animated_builder.dart';
import 'package:hundreddaysofflutterwidget/day028_dismissible.dart';
import 'package:hundreddaysofflutterwidget/day029_sized_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
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
  TextEditingController _textController = TextEditingController();

  Widget _appTitle = Text("100 Days of Widgtes");
  Map nav = {
    "SafeArea": Day1SafeArea(),
    "Expanded": Day2Expanded(),
    "Wrap": Day3Wrap(),
    "AnimationContainer": Day4AnimationContainer(),
    "Opacity": Day5Opacity(),
    "FutureBuilder": Day6FutureBuilder(),
    "FadeTransition": Day7FadeTransition(),
    "FloatingActionButton": Day8FloatingActionButton(),
    "PageView": Day9PageView(),
    "Table": Day10Table(),
    "SliverAppBar": Day11SliverAppBar(),
    "SliverGridList": Day12SliverGridList(),
    "FadeInImage": Day13FadeInImage(),
    "StreamBuilder": Day14StreamBuilder(),
    "InheritedWidget": Day15InheritedWidget(),
    "ClipRRect": Day16ClipRRect(),
    "Hero": Day17Hero(),
    "CustomPaint": Day18CustomPaint(),
    "Tooltip": Day19Tooltip(),
    "FittedBox": Day20FittedBox(),
    "LayoutBuilder": Day21LayoutBuilder(),
    "AbsorbPointer": Day22AbsorbPointer(),
    "Transform": Day23Transform(),
    "BackdropFilter": Day24BackdropFilter(),
    "Align": Day25Align(),
    "Positioned": Day26Positioned(),
    "AnimatedBuilder": Day27AnimatedBuilder(),
    "Dismissible": Day28Dismissible(),
    "SizedBox" : Day29SizedBox(),
  };

  List _listTitle = [
    "SafeArea",
    "Expanded",
    "Wrap",
    "AnimationContainer",
    "Opacity",
    "FutureBuilder",
    "FadeTransition",
    "FloatingActionButton",
    "PageView",
    "Table",
    "SliverAppBar",
    "SliverGridList",
    "FadeInImage",
    "StreamBuilder",
    "InheritedWidget",
    "ClipRRect",
    "Hero",
    "CustomPaint",
    "Tooltip",
    "FittedBox",
    "LayoutBuilder",
    "AbsorbPointer",
    "Transform",
    "BackdropFilter",
    "Align",
    "Positioned",
    "AnimatedBuilder",
    "Dismissible",
    "SizedBox"
  ];

  List fliter = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appTitle,
        actions: <Widget>[
          IconButton(
            icon: _appTitle is Text ? Icon(Icons.search) : Icon(Icons.close),
            onPressed: () {
              setState(() {
                _appTitle = _appTitle is Text
                    ? TextField(
                        controller: _textController,
                        autofocus: true,
                        decoration: InputDecoration(hintText: "Enter Here...."),
                        onChanged: (value) {
                          setState(() {
                            fliter = _listTitle
                                .where((string) => string
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      )
                    : Text("100 Days of Widgtes");

                    if ((_appTitle is Text)) {
                      setState(() {
                        fliter = _listTitle;
                      });
                    }
              });
            },
          )
        ], 
      ),
      body: SafeArea(
        child: fliter.length == 0? ListView.builder(
          itemCount: _listTitle.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_listTitle[index]),
              trailing: Text("Day ${index + 1}"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => nav[_listTitle[index]],
              )),
            );
          },
        ):ListView.builder(
          itemCount: fliter.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(fliter[index]),
              trailing: Text("Day ${_listTitle.indexOf(fliter[index]) + 1}"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => nav[fliter[index]],
              )),
            );
          },
        ),
      ),
    );
  }
}