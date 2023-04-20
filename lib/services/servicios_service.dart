import 'package:http/http.dart' as http;
import 'dart:convert';

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
    } else {
      throw Exception("********** Fallo getServiciosID ********* ");
    }
  } //fn getServidorID
}//fin class