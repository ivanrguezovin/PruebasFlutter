import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/home.dart';
import 'package:flutter_app/src/pages/listsPage.dart';
import 'package:flutter_app/src/pages/formPage.dart';
import 'package:flutter_app/src/pages/tapBarPage.dart';
import 'package:flutter_app/src/pages/image.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/list": (BuildContext context) => ListPage(),
        "/form": (BuildContext context) => FormPage(),
        "/bar": (BuildContext context) => TapBarPage(),
        "/image": (BuildContext context) => ImagePage(),
      },
    );
  }
}