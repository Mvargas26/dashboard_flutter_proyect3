import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:proyecto_progra/services/staticC.dart';
import '../models/monitoreoServidor_model.dart';
import '../services/servidor_service.dart';

class MonitoreoServidor extends StatefulWidget {
  @override
  State<MonitoreoServidor> createState() => _MonitoreoServidorState();
}

class _MonitoreoServidorState extends State<MonitoreoServidor> {
  Future<MonitoreoServidor_Model>? monitoreoServidor;
  bool _asynCall = false;

  void initState() {
    monitoreoServidor = Servidor_Service.monitoreoServidor(StaticC.idServidor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: TextButton(
    //     onPressed: () async {
    //       setState(() {
    //         _asynCall = true;
    //       });
    //       monitoreoServidor =
    //           Servidor_Service.monitoreoServidor(StaticC.idServidor);
    //       setState(() {
    //         _asynCall = false;
    //       });
    //     },
    //     child: Text("Ver Servidores"),
    //   ),
    // );

    return Scaffold(body: porcentajes());
  }

  Widget porcentajes() {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Circular Percent Indicators"),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.10,
                  center: new Text("10%"),
                  progressColor: Colors.red,
                  footer: new Text("CPU",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.30,
                  center: new Text("30%"),
                  progressColor: Colors.orange,
                  footer: new Text("RAM",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.60,
                  center: new Text("60%"),
                  progressColor: Colors.yellow,
                  footer: new Text("DISCO",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ],
            ),
          ),
          Container(
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
        ]),
      ),
    );
  } //fin porcentajes

  Widget _detalle() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Color.fromARGB(255, 41, 137, 216),
          child: Center(child: Text('Codigo del Servidor:')),
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 32, 168, 192),
          child: Center(child: Text('Nombre: ')),
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 41, 137, 216),
          child: Center(child: Text('Descripcion:')),
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 32, 168, 192),
          child: Center(child: Text('Usuario que Administra:')),
        ),
      ],
    );
  }
}//fin class
