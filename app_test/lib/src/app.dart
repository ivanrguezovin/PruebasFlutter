import 'package:app_test/src/screens/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan[300],
        accentColor: Colors.white
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => LoginPage(),
      },
    );
  }
}