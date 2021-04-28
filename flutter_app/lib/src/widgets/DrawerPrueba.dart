import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerPrueba extends StatelessWidget{

  const DrawerPrueba({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              _showPage(context: context, route: "/");
            },
            // close the drawer
          ),
          ListTile(
            leading: Icon(Icons.image_sharp),
            title: Text('Lista de imágenes random'),
            onTap: () {
              Navigator.pop(context);
              _showPage(context: context, route: "/list");
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Formulario'),
            onTap: () {
              Navigator.pop(context);
              _showPage(context: context, route: "/form");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
            onTap: () {Navigator.pop(context); _showDialogExit(context);},
          ),
        ],
      ),
    );
  }

  //Cambiar de página
  void _showPage({@required BuildContext context, @required String route, var args}) {
    Navigator.of(context).pushNamed(route, arguments: args,);
  }

  //Mostrar un Alertdialog
  Future<void> _showDialogExit(BuildContext context){
    return showDialog<void>(context: context, barrierDismissible: false, builder: (context){
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('¿Seguro que quiere cerrar la aplicación?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Salir'),
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
          ),
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }
}

