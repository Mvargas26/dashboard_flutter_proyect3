import 'package:flutter/material.dart';
import 'package:proyecto_progra/screens/elegirServidor.dart';
import 'package:proyecto_progra/screens/login.dart';
import 'package:proyecto_progra/screens/monitoreoServidor.dart';
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
      },
    );
  }
}
