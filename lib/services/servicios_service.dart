import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/monitoreoServicio_model.dart';
import '../models/servicio_model.dart';

class ServiciosService {
//VARIABLES
  //static String _baseURL = 'http://apiprogra.somee.com/';
  static String _baseURL = 'http://10.0.2.2:5021/';

  // Metodo para obtener Servicios  por id del servidor
  static Future<List<Servicio_Modelo>?> getServiciosID(String codServer) async {
    var url = Uri.parse(_baseURL + "Servicios/" + codServer);
    final response = await http.get(url);
    List<Servicio_Modelo> Servicios = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      //print(jsonData[1]["c"]["codServicio"]);
      if (body.isEmpty) {
        print("Fallo porque el body viene vacio");
        Servicios.add(
            Servicio_Modelo("Empty", "Empty", "Empty", "Empty", "Empty", 0));
        return Servicios;
      }

      for (var i = 0; i < jsonData.length; i++) {
        Servicios.add(Servicio_Modelo(
            jsonData[i]["c"]["codServicio"],
            jsonData[i]["c"]["nombServicio"],
            jsonData[i]["c"]["descServicio"],
            jsonData[i]["c"]["tipoServicio"],
            jsonData[i]["c"]["servidorPertenece"],
            int.parse(jsonData[i]["c"]["timeOut"].toString())));
      }

      return Servicios;
    } else if (response.statusCode == 404 || response.statusCode == 404) {
      Servicios.add(Servicio_Modelo(
          "Error 404", "Servicio no encontrado", "", "", "", 0));
      return Servicios;
    } else {
      print("Fallo porque el body viene vacio");
      Servicios.add(
          Servicio_Modelo("Empty", "Empty", "Empty", "Empty", "Empty", 0));
      return Servicios;
    }
  } //fn getServidorID

//Monitoreo de un servicio
  static Future<MonitoreoServicio_Model> monitoreoServicio(
      String codServer, String codServicio) async {
    var url = Uri.parse(
        _baseURL + "monitoreoServicio/" + codServer + "/" + codServicio);
    final response = await http.get(url);
    MonitoreoServicio_Model monitoreoActual =
        MonitoreoServicio_Model("", "", 0, DateTime.now(), "", 0);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      if (body.isEmpty) {
        print("Fallo porque el body viene vacio");
        return MonitoreoServicio_Model(
            "Empty", "Empty", 0, DateTime.now(), "Empty", 0);
      }

      final jsonData = jsonDecode(body);

      monitoreoActual.servidorPertenece = jsonData["servidorPertenece"];
      monitoreoActual.idServicio = jsonData["idServicio"];
      monitoreoActual.fechaMoniServicio =
          DateTime.parse(jsonData["fechaMoniServicio"]);
      monitoreoActual.estadoServicio =
          int.parse(jsonData["estadoServicio"].toString());
      monitoreoActual.timeOutServicio =
          int.parse(jsonData["timeOutServicio"].toString());
      monitoreoActual.estadoParam = jsonData["estadoParam"];

      return monitoreoActual;
    } else {
      throw Exception("***** Fallo Monitoreo Servicio ");
    }
  } //fn monitoreoServicio

//Activar Notificacion de Un Servicio
  static Future<String> activarNotifiServicio(
      String user, String codServicio) async {
    var url = Uri.parse(_baseURL +
        "Servicios/ActivarNotificacionServicio?user=" +
        user +
        "&codServicio=" +
        codServicio);
    final response = await http.put(url);

    print(response.body);

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, decodificamos los datos JSON y los retornamos
      return "Alertas Activadas";
    } else {
      // Si la respuesta no es exitosa, lanzamos una excepción con el mensaje de error
      return response.body.toString();
    }
  } //fn

  //Desactivar Notificacion de Un Servicio
  static Future<String> desactivarNotifiServicio(
      String user, String codServicio) async {
    var url = Uri.parse(_baseURL +
        "Servicios/DesactivarNotificacionServicio?user=" +
        user +
        "&codServicio=" +
        codServicio);
    final response = await http.put(url);

    print(response.body[1]);

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, decodificamos los datos JSON y los retornamos
      return "Alertas Desactivadas";
    } else {
      // Si la respuesta no es exitosa, lanzamos una excepción con el mensaje de error
      return response.body.toString();
    }
  } //fn
}//fin class