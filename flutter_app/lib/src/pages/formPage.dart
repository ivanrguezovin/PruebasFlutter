import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/widgets/DrawerPrueba.dart';

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

  //FocusNode
  FocusNode nameFocus;
  FocusNode surnameFocus;
  FocusNode emailFocus;
  FocusNode phoneFocus;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      decoration: InputDecoration(labelText: "Correo electrónico"),
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocus,
                      onEditingComplete: () =>requestFocus(context, nameFocus),
                      textInputAction: TextInputAction.next,
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
                      focusNode: nameFocus,
                      onEditingComplete: () =>requestFocus(context, surnameFocus),
                      textInputAction: TextInputAction.next,
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
                      focusNode: surnameFocus,
                      onEditingComplete: () => requestFocus(context, phoneFocus),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {surname = value;},
                      validator: (value) {
                        if(value.isEmpty){
                          return "Campo vacío";
                        }},
                    ),
                    TextFormField(
                      controller: phoneTextController,
                      decoration: InputDecoration(labelText: "Teléfono"),
                      keyboardType: TextInputType.phone,
                      focusNode: phoneFocus,
                      onSaved: (value) {
                        phone = value;
                      }, validator: (value) {
                      if(value.isEmpty){
                        return "Campo vacío";
                      }
                    },
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(onPressed: () {_send();}, child: Text("Enviar"), style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return Colors.green; // Use the component's default.
                        },
                      ),
                    ),)
                  ],),
              ),
            ), //Container(height: 800,color: Colors.black,)
            ],),
      )
    );
  }

  void _send(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      Navigator.of(context).pushNamed("/bar", arguments: FormData(this.name, this.surname, this.email, this.phone),);
    }
  }

  //Cambiar el foco
  void requestFocus(BuildContext context, FocusNode node){
    FocusScope.of(context).requestFocus(node);
  }

  @override
  void dispose(){
    super.dispose();
    this.nameTextController.dispose();
    this.surnameTextController.dispose();
    this.emailTextController.dispose();
    this.phoneTextController.dispose();

    nameFocus.dispose();
    surnameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
  }

  @override
  void initState(){
    super.initState();
    nameFocus = FocusNode();
    surnameFocus = FocusNode();
    emailFocus = FocusNode();
    phoneFocus = FocusNode();
  }
}

class FormData {
  String email;
  String name;
  String surname;
  String phone;
  FormData(this.name, this.surname, this.email, this.phone);
}