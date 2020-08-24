import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day98Streams extends StatefulWidget {
  Day98Streams({Key key}) : super(key: key);

  @override
  _Day98StreamsState createState() => _Day98StreamsState();
}

class _Day98StreamsState extends State<Day98Streams> {
  bool isUseingFuture;
  @override
  void initState() {
    isUseingFuture = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<int>(
              stream: getStreamByFuture(),
              initialData: 4,
              builder: (context, snapshot) => AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: Container(
                  key: ValueKey(snapshot.data ?? 4),
                  width: 250,
                  height: 250,
                  color: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.orange,
                    Colors.purple
                  ][snapshot.data],
                  child: Center(
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            if (isUseingFuture) ...[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('''
Stream<int> getStreamByFuture() async* {
  int count = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    yield count++ % 5;
  }
}
'''),
              )
            ] else ...[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('''
Stream<int> getStreamByPeriodic() =>
    Stream<int>.periodic(const Duration(seconds: 2), (count) => count % 5);
'''),
              )
            ],
            RaisedButton(
              onPressed: () {
                setState(() {
                  isUseingFuture = !isUseingFuture;
                });
              },
              child: Text(isUseingFuture
                  ? 'Try using Stream<int>.periodic'
                  : 'Try using yield with future'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Streams'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day098_streams.dart';
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

Stream<int> getStreamByPeriodic() =>
    Stream<int>.periodic(const Duration(seconds: 2), (count) => count % 5);

Stream<int> getStreamByFuture() async* {
  int count = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    yield count++ % 5;
  }
}
