import 'package:flutter/material.dart';

class DetalleServicios extends StatefulWidget {
  @override
  State<DetalleServicios> createState() => _DetalleServiciosState();
}

class _DetalleServiciosState extends State<DetalleServicios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _detalle());
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
}
