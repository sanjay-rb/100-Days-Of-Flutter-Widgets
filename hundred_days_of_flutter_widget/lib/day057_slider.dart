import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day57Slider extends StatelessWidget {
  const Day57Slider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyPage(),
      appBar: AppBar(
        title: Text("Slider"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day057_slider.dart';
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

class BodyPage extends StatefulWidget {
  BodyPage({Key key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  double _sliderValue = 1;

  RangeValues _rangeValue = RangeValues(1, 10);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.pink.withOpacity(_sliderValue / 10),
        child: Center(
          child: Column(
            // ? What is Slider....
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${_sliderValue.toInt()}",
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Normal Slider"),
              Slider(
                /**
                 * ! this is normal slider which show the start and end of the slider moment....
                 * ! [value] is the dynamic slidervalue which changes accordingly based on setstate of [_sliderValue]....
                 */
                value: _sliderValue,
                min: 1,
                max: 10,
                onChangeEnd: (value) =>
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("You Release The Slider"),
                        duration: Duration(
                          milliseconds: 500,
                        ))),
                onChangeStart: (value) =>
                    Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("You Touch The Slider"),
                  duration: Duration(milliseconds: 500),
                )),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              Text("iOS Slider"),
              CupertinoSlider(
                /**
                 * ! this is same slider with the iOs ui touch....
                 */
                value: _sliderValue,
                min: 1,
                max: 10,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              Text("Dynamic Slider (iOS/Android) with divisions and labels"),
              Slider.adaptive(
                /**
                 * ! this is the Dynamic slider which adapte the slider ui depent on the OS....
                 */
                value: _sliderValue,
                min: 1,
                max: 10,
                divisions:
                    10, // ! here i am used the divisions to set the splitup of the slider....
                label:
                    "${_sliderValue.toInt()}", // ! here i am display the label for the current division position....
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              Text(
                "${_rangeValue.start.toInt()} - ${_rangeValue.end.toInt()}",
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Range Slider for two range values"),
              RangeSlider(
                /**
                 * ! here comes the cool slider....
                 * ! which takes the [RangeValues] as value....
                 * ! that is this slider can set the value on both sides....
                 */
                values: _rangeValue,
                min: 1,
                max: 10,
                onChanged: (value) {
                  setState(() {
                    _rangeValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
