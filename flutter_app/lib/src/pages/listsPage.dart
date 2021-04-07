import 'package:flutter/material.dart';
import 'package:flutter_app/src/app.dart';

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
        title: Text("Lista de imágenes random"),
      ),
      drawer: DrawerPrueba(),
      body: ListView.builder(itemCount:50, itemBuilder: (context, index){
        final url = "https://picsum.photos/id/$index/400/300";
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed("/image", arguments: url);
          },
          child: Hero(
            tag: url,
            child: Card(child: FadeInImage(image: NetworkImage(url), placeholder: AssetImage("assets/spinner.gif"),),
            ),
          ),
        );
      })
    );
  }

}