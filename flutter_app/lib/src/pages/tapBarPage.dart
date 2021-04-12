import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/widgets/TableTest.dart';
import 'package:flutter_app/src/pages/formPage.dart';

class TapBarPage extends StatefulWidget {
  TapBarPage({Key key}) : super(key: key);
  TableTest tt = new TableTest();
  @override
  _TapBarPageState createState() => _TapBarPageState();
}

class _TapBarPageState extends State<TapBarPage> {
  @override
  Widget build(BuildContext context) {
    FormData data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddEntry(widget.tt)),
              );
            },
          );
        },
      ),
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Menú de barra"),
      ),
      body: ListView(children: [
        Column(
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
              child: widget.tt,
            ),
          ],
        )
      ],),
    );
  }
}

class AddEntry extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  TableTest tt;
  AddEntry(TableTest tt){this.tt=tt;}

  @override
  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  String name;
  String age;
  String role;

  void onFormSubmit() {
    if (widget.formKey.currentState.validate()) {
      buildRow(name, age, role);
      Navigator.of(context).pop();
      print(widget.tt.v);
    }
  }

  buildRow(name, age, role) {
    widget.tt.v.add(new DataRow(
        cells: <DataCell>[
          DataCell(Text(name)),
          DataCell(Text(age)),
          DataCell(Text(role)),]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: widget.formKey,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              TextFormField(
                autofocus: true,
                initialValue: "",
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                autofocus: true,
                initialValue: "",
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Age",
                ),
                onChanged: (value) {
                  setState(() {
                    age = value.toString();
                  });
                },
              ),
              TextFormField(
                autofocus: true,
                initialValue: "",
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Role",
                ),
                onChanged: (value) {
                  setState(() {
                    role = value;
                  });
                },
              ),
              OutlineButton(
                child: Text("Submit"),
                onPressed: onFormSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}