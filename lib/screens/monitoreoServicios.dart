import 'package:flutter/material.dart';

class MonitoreoServicios extends StatefulWidget {
  @override
  State<MonitoreoServicios> createState() => _MonitoreoServiciosState();
}

class _MonitoreoServiciosState extends State<MonitoreoServicios> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Monitoreo Servicios'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
