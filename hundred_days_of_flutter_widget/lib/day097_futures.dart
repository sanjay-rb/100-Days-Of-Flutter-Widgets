import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day97Futures extends StatefulWidget {
  Day97Futures({Key key}) : super(key: key);

  @override
  _Day97FuturesState createState() => _Day97FuturesState();
}

class _Day97FuturesState extends State<Day97Futures> {
  Future<String> _data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder(
                future: _data,
                initialData: "Click The Buttons Below",
                builder: (context, snapshot) => Text(
                  snapshot.connectionState.toString() +
                      '\n Data ' +
                      snapshot.data,
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                child: Text('Call Future Constructor'),
                onPressed: () {
                  setState(() {
                    _data = Future(() {
                      print("Running Future");
                      return "This is From Future Constructor";
                    });
                  });
                },
              ),
              RaisedButton(
                child: Text('Call Future.value'),
                onPressed: () {
                  setState(() {
                    _data = Future.value("This is from Future.value");
                  });
                },
              ),
              RaisedButton(
                child: Text('Call Future.delayed'),
                onPressed: () {
                  setState(() {
                    _data = Future.delayed(Duration(seconds: 2),
                        () => "This is from Future.delayed");
                  });
                },
              ),
              Builder(
                builder: (context) => RaisedButton(
                  child: Text('Call Future.delayed with success callback'),
                  onPressed: () {
                    setState(() {
                      Future.delayed(Duration(seconds: 2),
                              () => "Call Future.delayed with callback")
                          .then((value) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      });
                    });
                  },
                ),
              ),
              Builder(
                builder: (context) => RaisedButton(
                  child: Text('Call Future.delayed with error callback'),
                  onPressed: () {
                    setState(() {
                      Future.delayed(Duration(seconds: 2), () {
                        throw "Call Future.delayed with error callback";
                      }).then((value) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      }).catchError((onError) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(onError)));
                      });
                    });
                  },
                ),
              ),
              Builder(
                builder: (context) => RaisedButton(
                  child: Text(
                      'Call Future.delayed with error callback and when Complete'),
                  onPressed: () {
                    setState(() {
                      Future.delayed(Duration(seconds: 2), () {
                        throw "Call Future.delayed with error callback";
                      }).then((value) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      }).catchError((onError) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(onError)));
                      }).whenComplete(() {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Future Completed')));
                      });
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Futures'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day097_futures.dart';
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
