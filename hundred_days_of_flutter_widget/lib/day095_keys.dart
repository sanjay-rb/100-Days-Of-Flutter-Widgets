import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day95Keys extends StatefulWidget {
  Day95Keys({Key key}) : super(key: key);

  @override
  _Day95KeysState createState() => _Day95KeysState();
}

class _Day95KeysState extends State<Day95Keys> {
  List<Widget> _tileWithKeys, _tileWithoutKeys;

  bool _isKeys;

  @override
  void initState() {
    super.initState();
    _isKeys = false;
    _tileWithKeys = [
      StatefulColorTile(
        key: UniqueKey(),
      ),
      StatefulColorTile(
        key: UniqueKey(),
      ),
    ];
    _tileWithoutKeys = [
      StatefulColorTile(),
      StatefulColorTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _isKeys ? _tileWithKeys : _tileWithoutKeys,
            ),
            RaisedButton(
              child: Text(_isKeys ? 'Try Without Key' : 'Try With Key'),
              onPressed: () {
                setState(() {
                  _isKeys = !_isKeys;
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Swap'),
        onPressed: () {
          setState(() {
            _isKeys
                ? _tileWithKeys.insert(1, _tileWithKeys.removeAt(0))
                : _tileWithoutKeys.insert(1, _tileWithoutKeys.removeAt(0));
          });
        },
      ),
      appBar: AppBar(
        title: Text('Keys'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day095_keys.dart';
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

class StatefulColorTile extends StatefulWidget {
  StatefulColorTile({Key key}) : super(key: key);

  @override
  _StatefulColorTileState createState() => _StatefulColorTileState();
}

class _StatefulColorTileState extends State<StatefulColorTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: [
        Colors.red,
        Colors.green,
        Colors.yellow,
        Colors.blue,
        Colors.amber,
        Colors.deepOrange,
        Colors.deepPurple
      ][Random().nextInt(7)],
    );
  }
}
