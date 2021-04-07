import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/app.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.green,
        elevation: 11,
        title: Text("Viewer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Imagen seleccionada",style: TextStyle(fontSize: 24, color: Colors.green,  fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Card(child: Hero(tag: data, child: FadeInImage(image: NetworkImage(data), placeholder: AssetImage("assets/spinner.gif")))),
            Card(
              child: Image.network(
                  'https://upintelligence.es/wp-content/uploads/2020/01/cropped-logoB_2.png',
                  height: 100,
                  width: 120),
              color: Colors.black,
            )
          ]),
      ),
    );
  }
}

