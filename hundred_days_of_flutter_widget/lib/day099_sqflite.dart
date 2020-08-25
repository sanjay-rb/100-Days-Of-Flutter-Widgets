import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

// ! Model....
class Employee {
  int id;
  String name;
  Employee({this.id, this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  Employee.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}

// ! Controller....
class DBHelper {
  static Database _database;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'Employee';
  static const String DB_NAME = 'employee.db';

  Future<Database> get database async {
    _database = _database ?? await initDb();
    return _database;
  }

  initDb() async =>
      await openDatabase(DB_NAME, version: 1, onCreate: _onCreate);

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT)');
  }

  Future<Employee> saveEmployee(Employee employee) async {
    var dbClient = await database;
    employee.id = await dbClient.insert(TABLE, employee.toMap());
    return employee;

    // ! with the help of raw query....
    // await dbClient.transaction((txn) async {
    //   var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
    //   return await txn.rawInsert(query);
    // });
  }

  Future<List<Employee>> getEmployee() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME]);
    // ! with the help of raw query....
    // List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Employee> employees = [];
    if (maps.length > 0) {
      maps.forEach((element) {
        employees.add(Employee.fromMap(element));
      });
    }
    return employees;
  }

  Future<int> deleteEmployee(int id) async {
    var dbClient = await database;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> updateEmployee(Employee employee) async {
    var dbClient = await database;
    return await dbClient.update(TABLE, employee.toMap(),
        where: '$ID = ?', whereArgs: [employee.id]);
  }

  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}

// ! View....
class Day99LocalDataBaseWithSQLite extends StatefulWidget {
  Day99LocalDataBaseWithSQLite({Key key}) : super(key: key);

  @override
  _Day99LocalDataBaseWithSQLiteState createState() =>
      _Day99LocalDataBaseWithSQLiteState();
}

class _Day99LocalDataBaseWithSQLiteState
    extends State<Day99LocalDataBaseWithSQLite> {
  Future<List<Employee>> employees;
  TextEditingController controller = TextEditingController();
  String name;
  int curUserId;

  final formKey = new GlobalKey<FormState>();

  DBHelper dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    employees = dbHelper.getEmployee();
  }

  refreshList() {
    setState(() {
      employees = dbHelper.getEmployee();
    });
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) => value.length == 0 ? 'Enter Name' : null,
              onSaved: (newValue) => name = newValue,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlineButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        if (isUpdating) {
                          Employee e = Employee(id: curUserId, name: name);
                          dbHelper.updateEmployee(e);
                          setState(() {
                            isUpdating = false;
                          });
                        } else {
                          Employee e = Employee(id: null, name: name);
                          dbHelper.saveEmployee(e);
                        }
                        controller.text = '';
                        refreshList();
                      }
                    },
                    child: Text(isUpdating ? "Update" : "Add"),
                  ),
                  OutlineButton(
                    onPressed: () {
                      setState(() {
                        isUpdating = false;
                      });
                    },
                    child: Text("Cancel"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  dataTable(List<Employee> employees) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Delete')),
          ],
          rows: employees
              .map((employee) => DataRow(cells: [
                    DataCell(
                      Text(employee.name),
                      onTap: () {
                        setState(() {
                          isUpdating = true;
                          curUserId = employee.id;
                        });
                        controller.text = employee.name;
                      },
                    ),
                    DataCell(IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        dbHelper.deleteEmployee(employee.id);
                        refreshList();
                      },
                    )),
                  ]))
              .toList(),
        ),
      );

  list() {
    return Expanded(
        child: FutureBuilder(
      future: employees,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return dataTable(snapshot.data);
        }
        if (snapshot.data == null || snapshot.data.length == 0) {
          return Text('No Data Found');
        }
        return CircularProgressIndicator();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [form(), list()],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Local SQLITE Database'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day099_sqflite.dart';
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
