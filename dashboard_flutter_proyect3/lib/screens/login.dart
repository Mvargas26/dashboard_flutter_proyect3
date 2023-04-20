import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proyecto_progra/services/staticC.dart';
import '../widget/HeaderWidget.dart';
import '../widget/TextFieldCustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _asyncCall = false;
  bool _activo = false;
  final _idController = new TextEditingController();
  final _passController = new TextEditingController();

  bool _saving = false;

  double _headerHeight = 220;
  //Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 16, 90),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.86,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      _Titulo(context),
                      _inputId(context),
                      _inputpass(context),
                      _registrar(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputId(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom(
              icono: Icons.person_outline,
              type: TextInputType.text,
              pass: false,
              texto: 'Usuario',
              controller: _passController),
          SizedBox(
            height: 25,
          ),
        ]));
  }

  Widget _inputpass(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom(
              icono: Icons.password,
              type: TextInputType.text,
              pass: false,
              texto: 'Contraseña',
              controller: _idController),
          SizedBox(
            height: 25,
          ),
        ]));
  }

  Widget _Titulo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Iniciar Sesión',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
        ]));
  }

  Widget _registrar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: TextButton(
        onPressed: () {
          String user = _idController.text;
          String pass = _passController.text;
          login(context, user,
              pass); // Pasar los valores ingresados al método de inicio de sesión
          StaticC.userActivo = _passController.text;
          //Navigator.pushNamed(context, 'elegirServidor');
        },
        child: Text(
          'Iniciar sesión',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 247, 247, 248),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(146, 210, 192, 214),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                color: Color.fromARGB(146, 210, 192, 214),
              ),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(200, 50),
          ),
        ),
      ),
    );
  }
}

Future<void> login(BuildContext context, String user, String pass) async {
  final String apiUrl =
      'http://10.0.2.2:5021/iniciar/sesion/'; // Reemplaza con la URL de tu mini API
  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, String> body = {'nombUser': pass, 'passUser': user};

  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: json.encode(body));

  if (response.statusCode == 200) {
    // Si la respuesta es exitosa (código 200)
    final Map<String, dynamic> data = json.decode(response.body);

    // Mostrar mensaje satisfactorio
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Inicio de sesión exitoso'),
          content: Text('¡Bienvenido! $pass'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Redirigir a otra página
                Navigator.pushNamed(context,
                    'elegirServidor'); // Reemplaza '/home' con la ruta de la página de destino
              },
              child: Text('Continuar'),
            ),
          ],
        );
      },
    );
  } else {
    // Si la respuesta es incorrecta, mostrar mensaje de error
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error en el inicio de sesión'),
          content: Text('Usuario y/o contraseña incorrectos.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
