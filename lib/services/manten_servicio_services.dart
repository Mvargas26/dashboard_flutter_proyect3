// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:proyecto_progra/models/manten_servicio_model.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_progra/models/servicio_model.dart';

import '../models/manten_servicio_model.dart';
import '../models/servicio.dart';

class Servicio_Service {
  static String _baseURL = 'http://10.0.2.2:5021/';

  static Future<List<Servicio_Model>?> getServicio() async {
    var url = Uri.parse(_baseURL + "Servicios");
    final response = await http.get(url);
    List<Servicio_Model> Servicio = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var i = 0; i < jsonData.length; i++) {
        Servicio.add(Servicio_Model(
            jsonData[i]["c"]["codServicio"],
            jsonData[i]["c"]["nombServidor"],
            jsonData[i]["c"]["descServidor"],
            jsonData[i]["c"]["tipoServicio"],
            jsonData[i]["c"]["servidorPertenece"],
            jsonData[i]["c"]["timeOut"]));
      }

      return Servicio;
    } else {
      throw Exception("Error");
    }
  }

  static Future<List<Servicio_Model>?> getServicioID(int Id) async {
    var url = Uri.parse(_baseURL + "Servicios/$Id");
    final response = await http.get(url);
    List<Servicio_Model> ServicioId = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var i = 0; i < jsonData.length; i++) {
        ServicioId.add(Servicio_Model(
            jsonData[i]["c"]["codServicio"],
            jsonData[i]["c"]["nombServidor"],
            jsonData[i]["c"]["descServidor"],
            jsonData[i]["c"]["tipoServicio"],
            jsonData[i]["c"]["servidorPertenece"],
            jsonData[i]["c"]["timeOut"]));
      }

      return ServicioId;
    } else {
      throw Exception("Fallo");
    }
  }

  static Future<bool> createServicio(Servicio c) async{
    var url = Uri.parse(_baseURL + "ing_Servicio");
    final response = await http.post(url, 
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(c.toJson()));
    
    if(response.statusCode == 201){
      print("Servicio creado con exito.");
      return true;
    }else{
      return false;
    }
  }

  static Future<bool> updateServicio(Servicio servicio) async{
    var url = Uri.parse(_baseURL + "updt_Servicio");
    final response = await http.put(url,
    headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(servicio.toJson()));
    
    if(response.statusCode == 200){
      print("Servicio actualizado correctamente.");
      return true;
    }else{
      return false;
    }
  }

  static Future<bool> deleteServicio(String cod) async{
    var url = Uri.parse(_baseURL + "del_Servicios/$cod");
    final response = await http.delete(url);

    if(response.statusCode == 200){
      print("Servicio eliminado.");
      return true;
    }else{
      return false;
    }

  }

    static Future<List<Servicio>> getNombre() async {
    var url = Uri.parse(_baseURL + "Servicios");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Servicio> servidorList =
          jsonList.map((e) => Servicio.fromJson(e)).toList();
      return servidorList;
    } else {
      throw Exception("Fallo");
    }
  }

}