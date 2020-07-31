import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day74ProgressIndicator extends StatefulWidget {
  Day74ProgressIndicator({Key key}) : super(key: key);

  @override
  _Day74ProgressIndicatorState createState() => _Day74ProgressIndicatorState();
}

class _Day74ProgressIndicatorState extends State<Day74ProgressIndicator> {
  double loader = 0.0;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      Future.delayed(Duration(milliseconds: 500), () {
        if (loader <= 1.0) {
          print("loader : $loader");
          setState(() {
            loader += 0.05;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              /**
               * ? What is ProgressIndicator....
               * ! ProgressIndicator is the loader which we see on buffer stage....
               */
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Center(
                          // ! this is CircularProgressIndicator with value....
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                            strokeWidth: 10,
                            value: loader,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          // ! this is CircularProgressIndicator without value....
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Text(isLoading
                  ? "Loading..... ${(loader * 100).round()}%"
                  : "Completed ${(loader * 100).round()}%"),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Center(
                          // ! this is LinearProgressIndicator with value....
                          child: SizedBox(
                            width: 250,
                            child: LinearProgressIndicator(
                              value: loader,
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          // ! this is LinearProgressIndicator without value....
                          child: SizedBox(
                            width: 250,
                            child: LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.green),
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('ProgressIndicator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day074_progress_indicator.dart';
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
