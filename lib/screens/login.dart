import 'package:flutter/material.dart';
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
              controller: _idController),
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
          setState(() {
            _saving = true;
          });
          Navigator.pushNamed(context, 'elegirServidor');
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
