import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/DrawerPrueba.dart';

class ListPage extends StatelessWidget{

  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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