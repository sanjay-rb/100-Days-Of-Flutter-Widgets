import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum Using { Transforming, AsyncAsteriskFunction, StreamController }

class Day98Streams extends StatefulWidget {
  Day98Streams({Key key}) : super(key: key);

  @override
  _Day98StreamsState createState() => _Day98StreamsState();
}

class _Day98StreamsState extends State<Day98Streams> {
  Using using;
  @override
  void initState() {
    using = Using.Transforming;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StreamBuilder<int>(
                  stream: [
                    getStreamByPeriodic(),
                    getStreamByFuture(),
                    getStreamByStreamController()
                  ][using.index],
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
                [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('''
Stream<int> getStreamByPeriodic() =>
    Stream<int>.periodic(const Duration(seconds: 2), (count) => count % 5);
'''),
                  ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('''
Stream<int> getStreamByStreamController() {
  StreamController<int> controller;
  Timer timer;
  int counter = 0;

  void tick(_) {
    counter++;
    if (!controller.isClosed)
      controller.add(counter); // Ask stream to send counter values as event.
    if (counter == 4) {
      timer.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 2), tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  controller = StreamController<int>(
    onListen: startTimer,
    onPause: stopTimer,
    onResume: startTimer,
    onCancel: stopTimer,
  );

  return controller.stream;
}
'''),
                  )
                ][using.index],
                Wrap(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          using = Using.Transforming;
                        });
                      },
                      child: Text('Stream using Transforming'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          using = Using.AsyncAsteriskFunction;
                        });
                      },
                      child: Text('Stream using async*'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          using = Using.StreamController;
                        });
                      },
                      child: Text('Stream using StreamController'),
                    )
                  ],
                )
              ],
            ),
          ),
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

Stream<int> getStreamByStreamController() {
  StreamController<int> controller;
  Timer timer;
  int counter = 0;

  void tick(_) {
    counter++;
    if (!controller.isClosed)
      controller.add(counter); // Ask stream to send counter values as event.
    if (counter == 4) {
      timer.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 2), tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  controller = StreamController<int>(
    onListen: startTimer,
    onPause: stopTimer,
    onResume: startTimer,
    onCancel: stopTimer,
  );

  return controller.stream;
}
