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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 55, 107).withOpacity(0.4),
        title: Text('Servicios',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 228, 228, 228))),
       
      ),
      
      
      
      body: createBody());
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
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                StaticC.idServicio = snapshot.data![index].codServicio;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MonitoreoServicios(),
                  ),
                );
              },
              onLongPress: () {},
              child: Padding(
                padding: EdgeInsets.all(10), 
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(129, 227, 168, 212).withOpacity(0.3),
                    
                   
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data![index].codServicio,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        snapshot.data![index].nombServicio,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
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
