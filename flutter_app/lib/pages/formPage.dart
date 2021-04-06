import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class FormPage extends StatefulWidget {

  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //Guardar los valores del forms
  String name;
  String surname;

  //Controladores de los datos del formulario para que no se pierdan (por ejemplo al deslizar en un listView como hago aquí)
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();

  //Key global del forms
  final _formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameTextController,
                  decoration: InputDecoration(labelText: "Nombre"),
                  onSaved: (value) {
                    name = value;
                  }, validator: (value) {
                    if(value.isEmpty){
                      return "Campo vacío";
                    }
                },
                ),
                TextFormField(
                  controller: surnameTextController,
                  decoration: InputDecoration(labelText: "Apellido"),
                    onSaved: (value) {
                      surname = value;
                    }, validator: (value) {
                  if(value.isEmpty){
                    return "Campo vacío";
                  }
                },
                ),
                ElevatedButton(onPressed: () {_send();}, child: Text("Enviar"), style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return Colors.green; // Use the component's default.
                    },
                  ),
                ),)
              ],),
          ), //Container(height: 800,color: Colors.black,)
          ],),
      )
    );
  }

  void _send(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      Navigator.of(context).pushNamed("/list", arguments: FormData(this.name, this.surname),);
    }
  }
}

class FormData {
  String name;
  String surname;
  FormData(this.name, this.surname);
}