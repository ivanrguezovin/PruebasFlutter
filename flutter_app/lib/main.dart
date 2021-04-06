import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          print('Funciona el floatingButton');
          },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text('Prácticas con Flutter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('El botón + de la AppBar');
              }),
          IconButton(
              icon: Icon(Icons.minimize),
              onPressed: () {
                print('El botón minimize de la AppBar');
              })
        ],
      ),
      body: Container(margin: EdgeInsets.all(10), padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Hola, bienvenido a Flutter",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  icon: Icon(Icons.agriculture),
                  onPressed: () {
                    print('Funciona');
                  }),
              Center(
                child: Card(
                  child: Image.network(
                      'https://upintelligence.es/wp-content/uploads/2020/01/cropped-logoB_2.png',
                      height: 150,
                      width: 180),
                  color: Colors.black,
                ),
              )
            ],
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {Navigator.pop(context);},
              // close the drawer
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {Navigator.pop(context);},
            ),
          ],
        ),
      ),
    );
  }
}
