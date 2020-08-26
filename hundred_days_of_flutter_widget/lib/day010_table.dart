import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day10Table extends StatefulWidget {
  Day10Table({Key key}) : super(key: key);

  @override
  _Day10TableState createState() => _Day10TableState();
}

class _Day10TableState extends State<Day10Table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day010_table.dart';
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
        child: Table(
          // ? What is Table....
          defaultColumnWidth: FractionColumnWidth(0.1),
          /**
           * ! we can privide the column with for all the columns by [defaultColumnWidth]....
           * ! we can provide the values like :-
           * * FractionColumnWidth, FlexColumnWidth, FixedColumnWidth, IntrinsicColumnWidth....
           */
          columnWidths: {2: FractionColumnWidth(0.1)},
          /**
           * ! or we can provide the specify column with for the particular column by [columnWidths]....
           * ! here it accect Map as the value like {index : ColumnWidth}....
           */
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          /**
           * ! here we give the alingment of the Rows in the column....
           * ! we can provide the values like:-
           * * TableCellVerticalAlignment.top,
           * * TableCellVerticalAlignment.middle,
           * * TableCellVerticalAlignment.bottom,
           * * TableCellVerticalAlignment.fill,
           * * TableCellVerticalAlignment.baseline
           */
          textBaseline: TextBaseline.ideographic,
          /**
           * ! The text baseline to use when aligning rows using [TableCellVerticalAlignment.baseline]....
           * ! if the [defaultVerticalAlignment] carries the [TableCellVerticalAlignment.baseline] we can specify the change here....
           */
          textDirection: TextDirection.rtl,
          /**
           * ! this [textDirection] property is for the direction of the row....
           * ! weather is it right-to-left or left-to-right....
           */
          border: TableBorder.all(
            color: Colors.indigo[900],
            width: 2.0,
          ),
          /**
           * ! with the help of [border] property we can provide the border for the table....
           */
          children: [
            /**
             * ! this is the place we give the Table Rows for the Table....
             * ! this [children] of [Table] have the List of TableRows....
             */
            TableRow(children: [
              /**
               * ! this is the place we give the Ui-elements/Widgets for the TableRow....
               * ! where as this [children] of [TableRow] have the List of Widgets....
               */
              Container(
                height: 50,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.yellow,
              ),
              Container(
                height: 150,
                color: Colors.orange,
              ),
            ]),
            TableRow(children: [
              Container(
                height: 150,
                color: Colors.pink,
              ),
              Container(
                height: 100,
                color: Colors.black,
              ),
              Container(
                height: 50,
                color: Colors.blue,
              ),
            ]),
            TableRow(children: [
              Container(
                height: 50,
                color: Colors.green,
              ),
              Container(
                height: 100,
                color: Colors.purple,
              ),
              Container(
                height: 150,
                color: Colors.cyan,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
