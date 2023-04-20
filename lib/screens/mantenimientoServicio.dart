import 'package:flutter/material.dart';
import 'package:proyecto_progra/models/servicio.dart';
import 'package:proyecto_progra/services/servicios_service.dart';

import '../services/manten_servicio_services.dart';

class MantenimientoServicioPage extends StatefulWidget {
  @override
  State<MantenimientoServicioPage> createState() =>
      _MantenimientoServicioPageState();
}

class _MantenimientoServicioPageState extends State<MantenimientoServicioPage> {
  Future<List<Servicio>>? servicio;
  bool _asyncCall = false;
  bool _activo = false;
  final _servidorController = new TextEditingController();
  final _nombreController = new TextEditingController();
  final _descripcionController = new TextEditingController();
  final _admiRegistraController = new TextEditingController();
  final _contrasenaController = new TextEditingController();
  final _codigoomponenteController = new TextEditingController();
  final _umbralController = new TextEditingController();

  final _porcentajeController = new TextEditingController();
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'registrarServicio'),
                child: Text('Mantenimiento Servicios',
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
      appBar: AppBar(
        title: Text('Servicios',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(119, 252, 234, 252)),
        child: SizedBox(
          child: Stack(
            children: [
              Column(
                children: [
                  // TextField para ingresar el nombre del servidor
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nombre del servicio',
                      ),
                    ),
                  ),
                  // Botón para filtrar los servidores por nombre

                  SizedBox(height: 20),
                  Expanded(
                    child: _createBody('Nombre del servicio'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createBody(String nombreServicio) {
    return FutureBuilder(
      future: Servicio_Service.getNombre(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //entro aqui si hay datos
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data![index].codServicio),
                    Text(snapshot.data![index].nombServicio),
                    Text(snapshot.data![index].descServicio),
                    Text(snapshot.data![index].tipoServicio),
                    Text(snapshot.data![index].servidorPertenece),
                    Text(snapshot.data![index].timeOut.toString()),
                  ],
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
                  _asyncCall = true;
                });
                servicio = Servicio_Service.getNombre();
                setState(() {
                  _asyncCall = false;
                });
              },
              child: Text("Mostrar Servicios"),
            ),
          );
        }
        //Mientras es una u otra muestra la ruedita
      },
    );
  }

  Widget _inputBuscar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Nombre de usuario.',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
