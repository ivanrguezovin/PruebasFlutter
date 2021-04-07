import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/app.dart';
import 'package:flutter_app/src/pages/formPage.dart';

class TapBarPage extends StatelessWidget {
  const TapBarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FormData data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), backgroundColor: Colors.green, onPressed: () {

      },),
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Menú de barra"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Bienvenido ${data.name} ${data.surname}"),
                      Text("Email: ${data.email}"),
                      Text("Teléfono: ${data.phone}"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: TableTest(),
          ),
        ],
      ),
    );
  }
}

class TableTest extends StatelessWidget {
  const TableTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Age',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Role',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }
}