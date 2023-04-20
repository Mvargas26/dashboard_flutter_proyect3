import 'dart:async';

import 'package:flutter/material.dart';

import '../models/monitoreoServicio_model.dart';
import '../services/servicios_service.dart';
import '../services/staticC.dart';

class MonitoreoServicios extends StatefulWidget {
  @override
  State<MonitoreoServicios> createState() => _MonitoreoServiciosState();
}

class _MonitoreoServiciosState extends State<MonitoreoServicios> {
  Future<MonitoreoServicio_Model>? monitoreoServidor;
  bool _asynCall = false;
  String mensajeResponse = "";
  @override
  void initState() {
    super.initState();

    _ejecutarMonitoreoServicios();

    //Esta funcion vuelve a llamar al metodo cada 2 min
    Timer.periodic(Duration(seconds: 60), (timer) {
      _ejecutarMonitoreoServicios();
      print("Se recargo:" + DateTime.now().toString());
    });
  }

//////////////////////
  Future<void> _ejecutarMonitoreoServicios() async {
    try {
      setState(() {
        monitoreoServidor = ServiciosService.monitoreoServicio(
            StaticC.idServidor, StaticC.idServicio);
      });
    } catch (e) {
      print('Error al obtener Monitoreo Servicios: $e');
    }
  }

//////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: porcentajes());
  }

  /////metodos
  Widget porcentajes() {
    return FutureBuilder(
      future: monitoreoServidor,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            drawer: Drawer(
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                child: Column(children: [
                  SizedBox(
                    height: 60,
                  ),
                  TextButton(
                      onPressed: () => ServiciosService.activarNotifiServicio(
                                  StaticC.userActivo, StaticC.idServicio)
                              .then((resultado) {
                            // Creamos un AlertDialog con el resultado obtenido
                            AlertDialog alert = AlertDialog(
                              title: Text("Resultado"),
                              content: Text(resultado),
                              actions: [
                                TextButton(
                                  child: Text("Cerrar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                            // Mostramos el AlertDialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }),
                      child: Text('Activar Notificaciones para este Servicio',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 33, 34, 42)))),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () =>
                          ServiciosService.desactivarNotifiServicio(
                                  StaticC.userActivo, StaticC.idServicio)
                              .then((resultado) {
                            // Creamos un AlertDialog con el resultado obtenido
                            AlertDialog alert = AlertDialog(
                              title: Text("Resultado"),
                              content: Text(resultado),
                              actions: [
                                TextButton(
                                  child: Text("Cerrar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                            // Mostramos el AlertDialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }),
                      child: Text(
                          'Desactivar Notificaciones para este Servicio',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 33, 34, 42)))),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            ),
            appBar: new AppBar(
              title: new Text("Monitoreo del Servicio : " +
                  "\n" +
                  snapshot.data!.idServicio),
            ),
            body: Center(
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 60),
                  Container(
                    height: 60,
                    color: Color.fromARGB(164, 57, 94, 196),
                    child: Center(
                        child: Text(
                      'Nombre del Servicio: \n ' + snapshot.data!.idServicio,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    color: Color.fromARGB(164, 54, 171, 206),
                    child: Center(
                        child: Text(
                      'Fecha Monitoreo:' +
                          "\n" +
                          snapshot.data!.fechaMoniServicio.toString(),
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
                    color: snapshot.data!.estadoParam == "alert"
                        ? Colors.yellow
                        : snapshot.data!.estadoParam == "danger"
                            ? Colors.red
                            : snapshot.data!.estadoParam == "Empty"
                                ? Colors.red
                                : Colors.green,
                    child: Center(
                        child: Text(snapshot.data!.estadoParam,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(255, 161, 13, 13),
                                      Color.fromARGB(255, 210, 25, 25),
                                      Color.fromARGB(255, 245, 66, 66),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, 'detalleServicios');
                              },
                              child:
                                  const Text('Notificar Encargados por Correo'),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
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
