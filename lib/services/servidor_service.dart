import 'dart:convert';

import 'package:proyecto_progra/models/monitoreoServidor_model.dart';
import 'package:proyecto_progra/models/servidor_model.dart';
import 'package:http/http.dart' as http;

class Servidor_Service {
  //VARIABLES
  //static String _baseURL = 'http://apiprogra.somee.com/';
  static String _baseURL = 'http://10.0.2.2:5021/';

//*** Metodo para obtener Servidores
  static Future<List<Servidor_Model>?> getServidores() async {
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
  } //fn getServidores

// Metodo para obtener Servidor por id
  static Future<List<Servidor_Model>?> getServidorID() async {
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
  } //fn getServidorID

  //*** Metodo para obtener Monitoreo Servidor
  static Future<MonitoreoServidor_Model> monitoreoServidor(
      String codServer) async {
    var url = Uri.parse(_baseURL + "MonitoreoServer/" + codServer);
    final response = await http.get(url);
    MonitoreoServidor_Model monitoreoActual =
        MonitoreoServidor_Model("", "", DateTime.now(), 0, 0, 0, "");

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      if (body.isEmpty) {
        print("Fallo porque el body viene vacio");
        return MonitoreoServidor_Model(
            "Empty", "Empty", DateTime.now(), 0, 0, 0, "Empty");
      }

      final jsonData = jsonDecode(body);

      monitoreoActual.servidor = jsonData["codServidor"];
      monitoreoActual.nombre = jsonData["nombServidor"];
      monitoreoActual.fechaMonitoreo =
          DateTime.parse(jsonData["fechaMonitoreo"]);
      monitoreoActual.estado = jsonData["estadoParam"];
      monitoreoActual.cpu = int.parse(jsonData["usoCpu"].toString());
      monitoreoActual.memoria = int.parse(jsonData["usoMemoria"].toString());
      monitoreoActual.espacio = int.parse(jsonData["usoEspacio"].toString());

      return monitoreoActual;
    } else {
      throw Exception("Fallo");
    }
  } //fn getServidores
}//fin class 