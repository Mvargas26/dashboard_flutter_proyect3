import 'dart:async';

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

  @override
  void initState() {
    //monitoreoServidor = Servidor_Service.monitoreoServidor(StaticC.idServidor);
    super.initState();

    _ejecutarMonitoreoServidores();
    //Esta funcion vuelve a llamar al metodo cada 2 min
    Timer.periodic(Duration(seconds: 60), (timer) {
      _ejecutarMonitoreoServidores();
      print("Se recargo:" + DateTime.now().toString());
    });
  }

//////////////////////
  Future<void> _ejecutarMonitoreoServidores() async {
    try {
      setState(() {
        monitoreoServidor =
            Servidor_Service.monitoreoServidor(StaticC.idServidor);
      });
    } catch (e) {
      print('Error al obtener Monitoreo: $e');
    }
  }

//////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: porcentajes());
  }

  Widget porcentajes() {
    return FutureBuilder(
      future: monitoreoServidor,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: new AppBar(
              title: new Text(
                  "Monitoreo del Servidor : " + "\n" + snapshot.data!.nombre),
            ),
            body: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 4.0,
                          percent: snapshot.data!.cpu / 100,
                          center: new Text(snapshot.data!.cpu.toString() + "%"),
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
                          percent: (double.parse((snapshot.data!.memoria / 1000)
                                  .toStringAsFixed(0)) /
                              100),
                          center: new Text((snapshot.data!.memoria / 1000)
                                  .toStringAsFixed(0) +
                              "%"),
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
                          percent: snapshot.data!.espacio / 1000,
                          center: new Text(
                              (snapshot.data!.espacio / 10).toString() + "%"),
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
                    height: 50,
                    color: Color.fromARGB(255, 243, 242, 243),
                  ),
                  Container(
                    height: 60,
                    color: Color.fromARGB(255, 54, 94, 206),
                    child: Center(
                        child: Text(
                      'Nombre del Servidor: \n ' + snapshot.data!.nombre,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 60,
                    color: Color.fromARGB(255, 54, 171, 206),
                    child: Center(
                        child: Text(
                      'Fecha Monitoreo:' +
                          "\n" +
                          snapshot.data!.fechaMonitoreo.toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 243, 242, 243),
                    child: Center(
                      child: Text("Estado del Servidor: "),
                    ),
                  ),
                  Container(
                    height: 60,
                    color: snapshot.data!.estado == "alert"
                        ? Colors.yellow
                        : snapshot.data!.estado == "danger"
                            ? Colors.red
                            : snapshot.data!.estado == "Empty"
                                ? Colors.red
                                : Colors.green,
                    child: Center(
                        child: Text(snapshot.data!.estado,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            ),
          );
        } else {
          //entra aqui si no hay datos
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  } //fin metodo porcentajes
}//fin class
