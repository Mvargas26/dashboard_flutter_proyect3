import 'package:flutter/material.dart';
import 'package:proyecto_progra/models/servicio_model.dart';
import 'package:proyecto_progra/screens/monitoreoServicios.dart';
import 'package:proyecto_progra/services/servicios_service.dart';
import 'package:proyecto_progra/services/staticC.dart';

class DetalleServicios extends StatefulWidget {
  @override
  State<DetalleServicios> createState() => _DetalleServiciosState();
}

class _DetalleServiciosState extends State<DetalleServicios> {
  //VARIABLES
  late Future<List<Servicio_Modelo>?>? listadoServicios;
  bool _asynCall = false;

  @override
  void initState() {
    super.initState();
    listadoServicios = ServiciosService.getServiciosID(StaticC.idServidor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: createBody());
  }

  // **** METODOS ****
  Widget _detalle() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        const SizedBox(height: 60),
        Container(
          height: 60,
          color: Color.fromARGB(164, 57, 94, 196),
          child: Center(
              child: Text(
            'Nombre del Servidor: \n ',
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
            'Fecha Monitoreo:' + "\n",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ],
    );
  }

  Widget createBody() {
    return FutureBuilder(
      future: listadoServicios,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //entro aqui si hay datos
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  StaticC.idServicio = snapshot.data![index].codServicio;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              // MonitoreoServidor()));
                              MonitoreoServicios()));
                },
                onLongPress: () {},
                title: Text(snapshot.data![index].codServicio),
                subtitle: Text(snapshot.data![index].nombServicio),
              );
            },
          );
        } else {
          //entra aqui si no hay datos
          return Center(
            child: TextButton(
              onPressed: () async {
                setState(() {
                  _asynCall = true;
                });
                listadoServicios =
                    ServiciosService.getServiciosID(StaticC.idServidor);
                setState(() {
                  _asynCall = false;
                });
              },
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
