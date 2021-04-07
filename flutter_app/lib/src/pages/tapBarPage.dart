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
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Menú de barra"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
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
    );
  }
}

