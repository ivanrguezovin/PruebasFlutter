import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/widgets/TableTest.dart';
import 'package:flutter_app/src/pages/formPage.dart';

class TapBarPage extends StatefulWidget {
  const TapBarPage({Key key}) : super(key: key);

  @override
  _TapBarPageState createState() => _TapBarPageState();
}

class _TapBarPageState extends State<TapBarPage> {
  @override
  Widget build(BuildContext context) {

    List<String> v = [];
    FormData data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), backgroundColor: Colors.green, onPressed: () {}),
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