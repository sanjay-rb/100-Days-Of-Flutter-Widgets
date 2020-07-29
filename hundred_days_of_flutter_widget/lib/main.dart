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
import 'package:hundreddaysofflutterwidget/day030_value_listenable_builder.dart';
import 'package:hundreddaysofflutterwidget/day031_draggable.dart';
import 'package:hundreddaysofflutterwidget/day032_animated_list.dart';
import 'package:hundreddaysofflutterwidget/day033_flexible.dart';
import 'package:hundreddaysofflutterwidget/day034_media_query.dart';
import 'package:hundreddaysofflutterwidget/day035_spacer.dart';
import 'package:hundreddaysofflutterwidget/day036_animated_icon.dart';
import 'package:hundreddaysofflutterwidget/day037_inherited_model.dart';
import 'package:hundreddaysofflutterwidget/day038_aspect_ratio.dart';
import 'package:hundreddaysofflutterwidget/day039_limited_box.dart';
import 'package:hundreddaysofflutterwidget/day040_placeholder.dart';
import 'package:hundreddaysofflutterwidget/day041_richtext.dart';
import 'package:hundreddaysofflutterwidget/day042_reorderable_list_view.dart';
import 'package:hundreddaysofflutterwidget/day043_animated_switcher.dart';
import 'package:hundreddaysofflutterwidget/day044_animated_position.dart';
import 'package:hundreddaysofflutterwidget/day045_animated_padding.dart';
import 'package:hundreddaysofflutterwidget/day046_indexed_stack.dart';
import 'package:hundreddaysofflutterwidget/day047_semantics.dart';
import 'package:hundreddaysofflutterwidget/day048_constrained_box.dart';
import 'package:hundreddaysofflutterwidget/day049_stack.dart';
import 'package:hundreddaysofflutterwidget/day050_animated_opacity.dart';
import 'package:hundreddaysofflutterwidget/day051_fractionally_sized_box.dart';
import 'package:hundreddaysofflutterwidget/day052_list_view.dart';
import 'package:hundreddaysofflutterwidget/day053_list_tile.dart';
import 'package:hundreddaysofflutterwidget/day054_container.dart';
import 'package:hundreddaysofflutterwidget/day055_selectable_text.dart';
import 'package:hundreddaysofflutterwidget/day056_datatable.dart';
import 'package:hundreddaysofflutterwidget/day057_slider.dart';
import 'package:hundreddaysofflutterwidget/day058_alert_dialog.dart';
import 'package:hundreddaysofflutterwidget/day059_animated_cross_fade.dart';
import 'package:hundreddaysofflutterwidget/day060_draggable_scrollable_sheet.dart';
import 'package:hundreddaysofflutterwidget/day061_color_filtered.dart';
import 'package:hundreddaysofflutterwidget/day062_toggle_buttons.dart';
import 'package:hundreddaysofflutterwidget/day063_cupertino_action_sheet.dart';
import 'package:hundreddaysofflutterwidget/day064_tween_animation_builder.dart';
import 'package:hundreddaysofflutterwidget/day065_image.dart';
import 'package:hundreddaysofflutterwidget/day066_default_tab_controller_and_tab_bar.dart';
import 'package:hundreddaysofflutterwidget/day067_drawer.dart';
import 'package:hundreddaysofflutterwidget/day068_snack_bar.dart';
import 'package:hundreddaysofflutterwidget/day069_list_wheel_scroll_view.dart';
import 'package:hundreddaysofflutterwidget/day070_shader_mask.dart';
import 'package:hundreddaysofflutterwidget/day071_notification_listener.dart';
import 'package:hundreddaysofflutterwidget/day072_builder.dart';
import 'package:hundreddaysofflutterwidget/inherited_widget/day037_inherited_widget.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Hundred Days Of Flutter Widget',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.pinkAccent,
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
    "InheritedWidget": Day37InheritedWidget(),
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
    "SizedBox": Day29SizedBox(),
    "ValueListenableBuilder": Day30ValueListenableBuilder(),
    "Draggable": Day31Draggable(),
    "AnimatedList": Day32AnimatedList(),
    "Flexible": Day33Flexible(),
    "MediaQuery": Day34MediaQuery(),
    "Spacer": Day35Spacer(),
    "AnimatedIcon": Day36AnimatedIcon(),
    "InheritedModel": Day37InheritedModel(),
    "AspectRatio": Day38AspectRatio(),
    "LimitedBox": Day39LimitedBox(),
    "Placeholder": Day40Placeholder(),
    "RichText": Day41RichText(),
    "ReorderableListView": Day42ReorderableListView(),
    "AnimatedSwitcher": Day43AnimatedSwitcher(),
    "AnimatedPositioned": Day44AnimatedPositioned(),
    "AnimatedPadding": Day45AnimatedPadding(),
    "IndexedStack": Day46IndexedStack(),
    "Semantics": Day47Semantics(),
    "ConstrainedBox": Day48ConstrainedBox(),
    "Stack": Day49Stack(),
    "AnimatedOpacity": Day50AnimatedOpacity(),
    "FractionallySizedBox": Day51FractionallySizedBox(),
    "ListView": Day52ListView(),
    "ListTile": Day53ListTile(),
    "Container": Day54Container(),
    "SelectableText": Day55SelectableText(),
    "DataTable": Day56DataTable(),
    "Slider": Day57Slider(),
    "AlertDialog": Day58AlertDialog(),
    "AnimatedCrossFade": Day59AnimatedCrossFade(),
    "DraggableScrollableSheet": Day60DraggableScrollableSheet(),
    "ColorFiltered": Day61ColorFiltered(),
    "ToggleButtons": Day62ToggleButtons(),
    "CupertinoActionSheet": Day63CupertinoActionSheet(),
    "TweenAnimationBuilder": Day64TweenAnimationBuilder(),
    "Image": Day65Image(),
    "DefaultTabController & TabBar": Day66DefaultTabControllerAndTabBar(),
    "Drawer": Day67Drawer(),
    "SnackBar": Day68SnackBar(),
    "ListWheelScrollView": Day69ListWheelScrollView(),
    "ShaderMask": Day70ShaderMask(),
    "NotificationListener": Day71NotificationListener(),
    "Builder": Day72Builder()
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
    "SizedBox",
    "ValueListenableBuilder",
    "Draggable",
    "AnimatedList",
    "Flexible",
    "MediaQuery",
    "Spacer",
    "AnimatedIcon",
    "InheritedModel",
    "AspectRatio",
    "LimitedBox",
    "Placeholder",
    "RichText",
    "ReorderableListView",
    "AnimatedSwitcher",
    "AnimatedPositioned",
    "AnimatedPadding",
    "IndexedStack",
    "Semantics",
    "ConstrainedBox",
    "Stack",
    "AnimatedOpacity",
    "FractionallySizedBox",
    "ListView",
    "ListTile",
    "Container",
    "SelectableText",
    "DataTable",
    "Slider",
    "AlertDialog",
    "AnimatedCrossFade",
    "DraggableScrollableSheet",
    "ColorFiltered",
    "ToggleButtons",
    "CupertinoActionSheet",
    "TweenAnimationBuilder",
    'Image',
    "DefaultTabController & TabBar",
    "Drawer",
    "SnackBar",
    "ListWheelScrollView",
    "ShaderMask",
    "NotificationListener",
    "Builder"
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
                        cursorColor: Colors.white,
                        controller: _textController,
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Here....",
                        ),
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
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () async {
              const url =
                  'https://sanjaysanju618.github.io/100-Days-Of-Flutter-Widgets/';
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
        child: fliter.length == 0
            ? ListView.builder(
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
              )
            : ListView.builder(
                itemCount: fliter.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(fliter[index]),
                    trailing:
                        Text("Day ${_listTitle.indexOf(fliter[index]) + 1}"),
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
