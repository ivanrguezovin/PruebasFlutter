import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60,),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan[300], Colors.cyan[800]]
                )
              ),
              child: Image.asset("assets/images/logo.png", color: Colors.white,height: 200,),
            ),
            Transform.translate(
              offset: Offset(0,-5),
              child: Center(
                child: SingleChildScrollView( //Solucionamos el error de los campos de texto
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 2,
                    margin: EdgeInsets.only(left:20, right:20, top: 260),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: "Usuario"),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              decoration: InputDecoration(labelText: "Contraseña"),
                              obscureText: true,
                            ),
                            SizedBox(height: 15,),
                            ElevatedButton(onPressed: (){
                              _login(context);
                            }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Iniciar sesión"),
                                if(_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(),
                                ),
                              ],
                            ), style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  return Theme.of(context).primaryColor; // Use the component's default.
                                },
                              ),
                            ),),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("¿No estás registrado?"),
                                TextButton(style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      return Theme.of(context).primaryColor; // Use the component's default.
                                    },
                                  ),
                                ), onPressed: (){
                                  _showRegister(context);
                                }, child: Text("Registrarse"),)
                              ],
                            )
                          ],
                        ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if(!_loading){
      setState(() {
        _loading = true;
      });
    }
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed("/register");
  }

}