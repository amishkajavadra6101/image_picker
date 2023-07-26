import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SyncfusionFlutterDatagrid extends StatefulWidget {
  const SyncfusionFlutterDatagrid({Key? key}) : super(key: key);

  @override
  State<SyncfusionFlutterDatagrid> createState() =>
      _SyncfusionFlutterDatagridState();
}

class _SyncfusionFlutterDatagridState extends State<SyncfusionFlutterDatagrid> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Example of Syncfusion Flutter DataGrid",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SfDataGrid(
              source: employeeDataSource,
              columnWidthMode: ColumnWidthMode.fill,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: const Text('ID',
                          style: TextStyle(color: Colors.white))),
                ),
                GridColumn(
                    columnName: 'name',
                    label: Container(
                        padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: const Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        ))),
                GridColumn(
                    columnName: 'designation',
                    label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: const Text(
                          'Designation',
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'salary',
                    label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: const Text('Salary',
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10007, 'Balnc', 'Designer', 15000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10009, 'Gable', 'Designer', 15000),
    ];
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

  final int id;
  final String name;
  final String designation;
  final int salary;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == 'id' && e.value is int && e.value >= 10006) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          color: Colors.green,
          // Change the background color for 'Salary' >= 20000
          child:
              Text(e.value.toString(), style: const TextStyle(color: Colors.white)),
        );
      } else if (e.columnName == 'salary' &&
          e.value is int &&
          e.value > 15000) {
        return Container(
          alignment: Alignment.center,
          color: Colors.blueAccent,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString(),
              style: const TextStyle(color: Colors.white)),
        );
      } else if (e.columnName == 'salary' &&
          e.value is int &&
          e.value > 15000) {
        return Container(
          alignment: Alignment.center,
          color: Colors.blueAccent,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString(),
              style: const TextStyle(color: Colors.white)),
        );
      } else if (e.columnName == 'designation' &&
          e.value is String &&
          e.value == 'Designer') {
        return Container(
          alignment: Alignment.center,
          color: Colors.amber,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString(),
              style: const TextStyle(color: Colors.white)),
        );
      } else if (e.columnName == 'name' &&
          e.value is String &&
          e.value == 'Martin') {
        return Container(
          alignment: Alignment.center,
          color: Colors.black87,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString(),
              style: const TextStyle(color: Colors.white)),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }
    }).toList());
  }
}
