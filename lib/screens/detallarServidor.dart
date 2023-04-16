import 'package:flutter/material.dart';
import '../models/servidor_model.dart';

class DetallarServidor extends StatefulWidget {
  //VARIABLES
  final Servidor_Model _servidor_model;

  DetallarServidor(this._servidor_model);
  @override
  State<DetallarServidor> createState() => _DetallarServidorState();
}

class _DetallarServidorState extends State<DetallarServidor> {
  Servidor_Model server = Servidor_Model("1", "1", "1", "1", "1");
  late TextEditingController _idController;
  @override
  void initState() {
    Servidor_Model sr = widget._servidor_model;
    server.codServidor = sr.codServidor;
    _idController = new TextEditingController(text: sr.codServidor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //se usa para poner el fondo
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Color.fromARGB(129, 139, 66, 121).withOpacity(0.4),
              Color.fromARGB(129, 139, 66, 121).withOpacity(0.4),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: card1(context)),
          ],
        ),
      ),
    );
  }

  Widget card1(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        margin: EdgeInsets.only(top: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'servidorW');
                  },
                  child: Container(
                    height: 500,
                    width: 250,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(53, 255, 255, 255),
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: _detalle(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _detalle() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Color.fromARGB(255, 167, 109, 175),
          child: const Center(child: Text('Codigo del Servidor:')),
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 167, 109, 175),
          child: const Center(child: Text('Nombre:')),
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 167, 109, 175),
          child: const Center(child: Text('Descripcion:')),
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 167, 109, 175),
          child: const Center(child: Text('Usuario que Administra:')),
        ),
      ],
    );
  }
}//fin class
