import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/widgets/DrawerPrueba.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _showDialogExit(context);
        },
        child: Icon(Icons.add),
      ),
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Inicio"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Text('Working a lot harder'),
              ),
              const PopupMenuItem(
                child: Text('Being a lot smarter'),
              ),
              const PopupMenuItem(
                child: Text('Being a self-starter'),
              ),
              const PopupMenuItem(
                child: Text('Placed in charge of trading charter'),
              ),
            ],
          ),
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
                  icon: Icon(Icons.home_work),onPressed: (){},),
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

  //Mostrar un Alertdialog
  void _showDialogExit(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return SimpleDialog(
        children: <Widget>[
          ListTile(
            title: Text('Añadir'),
            leading: Icon(Icons.add),
            onTap: () {
              print("Añadido");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Editar'),
            leading: Icon(Icons.edit),
            onTap: () {
              print("Editar");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Cancelar'),
            leading: Icon(Icons.cancel),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

}

