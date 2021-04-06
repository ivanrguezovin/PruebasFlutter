import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class MyHomePage extends StatelessWidget {


  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Inicio"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('El botón + de la AppBar');
              }),
        ],
      ),
      body: Container(margin: EdgeInsets.all(10), padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Hola, bienvenido a Flutter",
                style: TextStyle(fontSize: 24, color: Colors.green,  fontWeight: FontWeight.bold, letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  icon: Icon(Icons.home_work),
                  onPressed: () {
                    print('Funciona');
                  }),
              Card(
                  child: Image.network(
                      'https://upintelligence.es/wp-content/uploads/2020/01/cropped-logoB_2.png',
                      height: 80,
                      width: 100),
                  color: Colors.black,
                ),
              Text("Esta será una aplicación de pruebas para aprender a manejar los diferentes elementos de Flutter"),
              ElevatedButton(style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.green; // Use the component's default.
                  },
                ),
              ),onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Awesome Snackbar!'),
                  action: SnackBarAction(label: 'Cerrar', onPressed: () {}, textColor: Colors.white,),
                  duration: Duration(milliseconds: 1500), padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),));},
                  child: Text("Snackbar")),
          ])),
      drawer: DrawerPrueba(),
    );
  }
}

