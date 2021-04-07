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
  String email;
  String phone;

  //Controladores de los datos del formulario para que no se pierdan (por ejemplo al deslizar en un listView como hago aquí)
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();

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
                  controller: emailTextController,
                  decoration: InputDecoration(labelText: "Correo electrónico"),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    email = value;
                  }, validator: (value) {
                  if(value.isEmpty){
                    return "Campo vacío";
                  }
                },
                ),
                TextFormField(
                  controller: nameTextController,
                  decoration: InputDecoration(labelText: "Nombre"),
                  keyboardType: TextInputType.name,
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
                  keyboardType: TextInputType.name,
                    onSaved: (value) {
                      surname = value;
                    }, validator: (value) {
                  if(value.isEmpty){
                    return "Campo vacío";
                  }
                },
                ),
                TextFormField(
                  controller: phoneTextController,
                  decoration: InputDecoration(labelText: "Teléfono"),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    phone = value;
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
      Navigator.of(context).pushNamed("/list", arguments: FormData(this.name, this.surname, this.email, this.phone),);
    }
  }
}

class FormData {
  String email;
  String name;
  String surname;
  String phone;
  FormData(this.name, this.surname, this.email, this.phone);
}