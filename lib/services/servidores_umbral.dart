import 'dart:convert';
import 'package:proyecto_progra/models/servidor_model.dart';
import '/models/servidor_nombreModel.dart';
import 'package:http/http.dart' as http;
import '/models/umbral.dart';
import '/models/servidor.dart';

class Umbral_Service {
  //VARIABLES
  static String _baseURL = 'http://10.0.2.2:5021/';

  //*** Metodo para obtener Seervidor
  static Future<List<ServidorNombre>> getNombre() async {
    var url = Uri.parse(_baseURL + "servidorUmbral1");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<ServidorNombre> servidorList =
          jsonList.map((e) => ServidorNombre.fromJson(e)).toList();
      return servidorList;
    } else {
      throw Exception("Fallo");
    }
  }

//*** Metodo para Crear parametro
  static Future<bool> createUmbral(Umbral c) async {
    var url = Uri.parse(_baseURL + "paramSensibilidad");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(c.toJson()));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

//*** Metodo para Crear servidor
  static Future<bool> createServidor(ServidoresR c) async {
    var url = Uri.parse(_baseURL + "Servidor");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(c.toJson()));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

//*** Metodo para Eliminar parametro
  static Future<bool> eliminarUmbral(
      String server, String umbral, String componente) async {
    var url = Uri.parse(_baseURL +
        "paramSensibilidad/" +
        server +
        "/" +
        umbral +
        "/" +
        componente +
        "");

    final response = await http.delete(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //*** Metodo para EDITAR parametro
  static Future<bool> ediparametro(Umbral c) async {
    var url = Uri.parse(_baseURL + 'paramSensibilidad');

    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(c.toJson()));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } //fn editarparametro

//*** Metodo para EDITAR servidor
  static Future<bool> editarServidor(ServidoresR c) async {
    var url = Uri.parse(_baseURL + 'Servidor');

    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(c.toJson()));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } //fn sevidor

  //*** Metodo para Eliminar parametro
  static Future<bool> eliminarServidor(String server) async {
    var url = Uri.parse(_baseURL + "del_Servicios+ /" + server + "");

    final response = await http.delete(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<ServidorNombre>> buscarServidor(String nombre) async {
    var url = Uri.parse(_baseURL + "servidorUmbral/" + nombre + "");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<ServidorNombre> servidorList =
          jsonList.map((e) => ServidorNombre.fromJson(e)).toList();
      return servidorList;
    } else {
      throw Exception("Fallo");
    }
  }
}
