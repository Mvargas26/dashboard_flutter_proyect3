import 'package:flutter/material.dart';
import 'package:proyecto_progra/screens/Filtrar.dart';
import 'package:proyecto_progra/screens/detalleServicios.dart';
import 'package:proyecto_progra/screens/elegirServidor.dart';
import 'package:proyecto_progra/screens/login.dart';
import 'package:proyecto_progra/screens/mantenimientoServicio.dart';
import 'package:proyecto_progra/screens/mantenimientoServidor.dart';
import 'package:proyecto_progra/screens/monitoreoServidor.dart';
import 'package:proyecto_progra/screens/registar_parametros.dart';
import 'package:proyecto_progra/screens/registrar_Servicio.dart';
import 'package:proyecto_progra/screens/registrar_Servidor.dart';
import 'package:proyecto_progra/screens/servidorWindows.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => LoginPage(),
        'elegirServidor': (_) => ElegirSeridorPage(),
        'servidorW': (_) => ServidorWPage(),
        'moniServidor': (_) => MonitoreoServidor(),
        // 'mantenimientoServicio': (_) => MantenimientoServicioPage(),
        'mantenimientoServidor': (_) => MantenimientoServiidorPage(),
        'registrarParametros': (_) => RegistrarParametrosPage(),
        'registrarServicio': (_) => RegistroServicioPage(),
        'registrarServidor': (_) => RegistrarServidorPage(),
        'detalleServicios': (_) => DetalleServicios(),
        'moniServicios': (_) => DetalleServicios(),
        'filtarServidor':(_)=>filtrarPage(),

      },
    );
  }
}
