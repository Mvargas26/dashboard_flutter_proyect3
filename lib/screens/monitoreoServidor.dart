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
                          percent: snapshot.data!.cpu / 10,
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
                    height: 50,
                    color: Color.fromARGB(255, 243, 242, 243),
                  ),
                  Container(
                    height: 60,
                    color: Color.fromARGB(255, 54, 94, 206),
                    child: Center(
                        child: Text('Nombre del Servidor:' +
                            "\n" +
                            snapshot.data!.nombre)),
                  ),
                  Container(
                    height: 60,
                    color: Color.fromARGB(255, 54, 171, 206),
                    child: Center(
                        child: Text('Fecha Monitoreo:' +
                            "\n" +
                            snapshot.data!.fechaMonitoreo.toString())),
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
