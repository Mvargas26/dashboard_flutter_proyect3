import 'dart:convert';

import 'package:proyecto_progra/models/servidor_model.dart';
import 'package:http/http.dart' as http;

class Servidor_Service {
  //VARIABLES
  //static String _baseURL = 'http://apiprogra.somee.com/';
  static String _baseURL = 'http://10.0.2.2:5021/';

//*** Metodo para obtener Usuarios
  static Future<List<Servidor_Model>?> getUsuarios() async {
    var url = Uri.parse(_baseURL + "servidor");
    final response = await http.get(url);
    List<Servidor_Model> Servidores = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var i = 0; i < jsonData.length; i++) {
        Servidores.add(Servidor_Model(
            jsonData[i]["c"]["codServidor"],
            jsonData[i]["c"]["nombServidor"],
            jsonData[i]["c"]["descServidor"],
            jsonData[i]["c"]["userAdmiServidor"],
            jsonData[i]["c"]["passServidor"]));
      }

      return Servidores;
    } else {
      throw Exception("Fallo");
    }
  } //fn getUsuarios
}//fin class