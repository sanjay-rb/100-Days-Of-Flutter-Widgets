import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day85TimePicker extends StatefulWidget {
  Day85TimePicker({Key key}) : super(key: key);

  @override
  _Day85TimePickerState createState() => _Day85TimePickerState();
}

class _Day85TimePickerState extends State<Day85TimePicker> {
  TimeOfDay currentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListTile(
            onTap: () async {
              TimeOfDay seletedTime = await showTimePicker(
                context: context, // ! need to pass the context....
                initialTime: currentTime, // ! initial selected time...
              );
              setState(() {
                // ! seletedTime is null then set back to currentTime....
                // ! with dart null safety operator....
                currentTime = seletedTime ?? currentTime;
              });
            },
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Time ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(
                      text: '${currentTime.hour % 12 != 0 ? currentTime.hour % 12 : 12}hr' +
                          ':${currentTime.minute}mins' +
                          ' ${currentTime.period == DayPeriod.am ? 'am' : 'pm'}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black)),
                ],
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Railway Time ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  TextSpan(
                      text: '${currentTime.hour}hr:${currentTime.minute}mins',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey)),
                ],
              ),
            ),
            trailing: Icon(Icons.date_range),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('TimePicker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day085_time_picker.dart';
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
