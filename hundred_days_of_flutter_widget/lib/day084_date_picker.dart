import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day84DatePicker extends StatefulWidget {
  Day84DatePicker({Key key}) : super(key: key);

  @override
  _Day84DatePickerState createState() => _Day84DatePickerState();
}

class _Day84DatePickerState extends State<Day84DatePicker> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListTile(
            onTap: () async {
              DateTime selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990, 1, 1),
                lastDate: DateTime(2100, 12, 31),
              );
              setState(() {
                currentDate = selectedDate;
              });
            },
            title: Text(
                '${currentDate.day}/${currentDate.month}/${currentDate.year}'),
            trailing: Icon(Icons.date_range),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('DatePicker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day084_date_picker.dart';
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
