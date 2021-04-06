import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ListPage extends StatelessWidget{

  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Capturar los argumentos enviados en el cambio de pantalla
    final data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Listas"),
      ),
      drawer: DrawerPrueba(),
    );
  }

}

/*
class ListPageArgs {
  String texto;
  ListPageArgs({this.texto});
}*/