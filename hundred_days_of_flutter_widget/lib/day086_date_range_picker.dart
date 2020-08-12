import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day86DateRangePicker extends StatefulWidget {
  Day86DateRangePicker({Key key}) : super(key: key);

  @override
  _Day86DateRangePickerState createState() => _Day86DateRangePickerState();
}

class _Day86DateRangePickerState extends State<Day86DateRangePicker> {
  DateTimeRange currentDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListTile(
            onTap: () async {
              // ! We can pick the range of Dates by [showDateRangePicker]....
              DateTimeRange seletedDateRange = await showDateRangePicker(
                context: context, // ! need to pass the context....
                firstDate:
                    DateTime(1990, 1, 1), // ! boundary of dates from starts....
                lastDate:
                    DateTime(2100, 12, 31), // ! boundary of dates from ends....
                initialDateRange:
                    currentDateRange, // ! initial selected date range...
              );
              setState(() {
                // ! seletedDateRange is null then set back to currentDateRange....
                // ! with dart null safety operator....
                currentDateRange = seletedDateRange ?? currentDateRange;
              });
            },
            title: Text('Starts - ${currentDateRange.start.day}' +
                '/${currentDateRange.start.month}' +
                '/${currentDateRange.start.year}' +
                '\nEnds - ${currentDateRange.end.day}' +
                '/${currentDateRange.end.month}' +
                '/${currentDateRange.end.year}'),
            trailing: Icon(Icons.date_range),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('DateRangePicker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day086_date_range_picker.dart';
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
