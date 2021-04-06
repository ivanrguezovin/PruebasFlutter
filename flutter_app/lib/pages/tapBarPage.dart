import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class TapBarPage extends StatefulWidget {
  const TapBarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("TapBar"),
      ),
      drawer: DrawerPrueba(),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

