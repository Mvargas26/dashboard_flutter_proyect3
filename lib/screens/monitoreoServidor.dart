import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          setState(() {
            _asynCall = true;
          });
          monitoreoServidor =
              Servidor_Service.monitoreoServidor(StaticC.idServidor);
          setState(() {
            _asynCall = false;
          });
        },
        child: Text("Ver Servidores"),
      ),
    );
  }
}
