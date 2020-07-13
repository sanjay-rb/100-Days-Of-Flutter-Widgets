import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day56DataTable extends StatefulWidget {
  Day56DataTable({Key key}) : super(key: key);

  @override
  _Day56DataTableState createState() => _Day56DataTableState();
}

class _Day56DataTableState extends State<Day56DataTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          /**
           * ? What is DataTable....
           * ! DataTable is the very cool table view for the users.....
           * * DataTable
           * *   --> DataColumn as colums
           * *   --> DataRows as rows
           * *       --> DataCell as cells
           */
          child: DataTable(
              // we have multiple options to maintain the table....
              sortAscending: true, // ! like sortAscending....
              sortColumnIndex: 2, // ! and sortColumn....
              columns: [
                // ! all columns have the lable to display the user....
                DataColumn(
                  label: Text("Name"),
                  numeric:
                      false, // ! [numeric] is the feild to mention the datas are numbers....
                ),
                DataColumn(label: Text("DOB"), numeric: false),
                DataColumn(
                  label: Text("Age"),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      true, // ! here we add the sort logic as per the user need....
                ),
                DataColumn(label: Text("City"), numeric: false),
                DataColumn(label: Text("Mark1"), numeric: true),
                DataColumn(label: Text("Mark2"), numeric: true),
                DataColumn(label: Text("Mark3"), numeric: true)
              ],
              rows: [
                // ! rows have the cells for all the column mentioned above....
                DataRow(cells: [
                  DataCell(Text("Sanju")),
                  DataCell(Text("24/04/1999")),
                  DataCell(Text("21")),
                  DataCell(Text("CBE")),
                  DataCell(Text("10")),
                  DataCell(Text("20")),
                  DataCell(Text("10"))
                ]),
                DataRow(cells: [
                  DataCell(Text("Shari")),
                  DataCell(Text("11/07/2005")),
                  DataCell(Text("21")),
                  DataCell(Text("CBE")),
                  DataCell(Text("90")),
                  DataCell(Text("100")),
                  DataCell(Text("90"))
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("Fill Name"),
                    placeholder:
                        true, // ! we can add the [placeholder] as the cell
                    showEditIcon:
                        true, // ! we can mention the edit icon for update or edit the data....
                    onTap: () {
                      // ! and also the tap event handels....
                      showDialog(
                        context: context,
                        builder: (context) => Card(
                            child:
                                Center(child: Text("You can edit here...."))),
                      );
                    },
                  ),
                  DataCell(Text("15/08/1998")),
                  DataCell(Text("22")),
                  DataCell(Text("CBE")),
                  DataCell(Text("85")),
                  DataCell(Text("88")),
                  DataCell(Text("80"))
                ]),
                DataRow(cells: [
                  DataCell(Text("Ram")),
                  DataCell(Text("13/09/1999")),
                  DataCell(Text("21")),
                  DataCell(Text("CBE")),
                  DataCell(Text("99")),
                  DataCell(Text("89")),
                  DataCell(Text("88"))
                ]),
                DataRow(cells: [
                  DataCell(Text("Pavi")),
                  DataCell(Text("25/04/1999")),
                  DataCell(Text("21")),
                  DataCell(Text("CBE")),
                  DataCell(Text("86")),
                  DataCell(Text("85")),
                  DataCell(Text("84"))
                ]),
                DataRow(cells: [
                  DataCell(Text("Nivi")),
                  DataCell(Text("30/09/1999")),
                  DataCell(Text("21")),
                  DataCell(Text("KOZ")),
                  DataCell(Text("50")),
                  DataCell(Text("59")),
                  DataCell(Text("86"))
                ]),
              ]),
        ),
      ),
      appBar: AppBar(
        title: Text("DataTable"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day056_datatable.dart';
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
