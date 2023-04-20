import 'dart:convert';

import 'package:proyecto_progra/models/monitoreoServidor_model.dart';
import '/models/filtrarPorNombreModel.dart';
import 'package:http/http.dart' as http;

import '../models/filtrarPorNombreModel.dart';

class filtrarServidor_Service {

  static String _baseURL = 'http://10.0.2.2:5021/';

  // Método para obtener Servidor por nombre
 static Future<List<ServidorNombre1>?> filtrarServidores(String nombre) async {
  var url = Uri.parse(_baseURL + "servidorUmbral/"+nombre+"");
  final response = await http.get(url);
  List<ServidorNombre1> Servidores = [];

  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);

    final jsonData = jsonDecode(body);

    for (var i = 0; i < jsonData.length; i++) {
      Servidores.add(ServidorNombre1(
          jsonData[i]["servidor"],
          jsonData[i]["nombre"],
          jsonData[i]["descripcion"],
          jsonData[i]["administrador"],
          jsonData[i]["contrasena"],
          jsonData[i]["umbral"],
          jsonData[i]["componente"],
          jsonData[i]["porcentaje"]
      ));
    }
    return Servidores;
  } else {
    throw Exception("Fallo");
  }
}
}

