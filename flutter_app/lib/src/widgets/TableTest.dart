import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableTest extends StatefulWidget {
  TableTest({Key key}) : super(key: key);

  @override
  _TableTestState createState() => _TableTestState();
  List<DataRow> v = [];
}

class _TableTestState extends State<TableTest> {
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
      rows: widget.v,
    );
  }

  @override
  void initState(){
    super.initState();
    widget.v = <DataRow>[
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
    ];

  }
}