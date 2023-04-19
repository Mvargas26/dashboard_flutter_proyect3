// To parse this JSON data, do
//
//     final servicio = servicioFromJson(jsonString);

import 'dart:convert';

String servicioToJson(List<Servicio_Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servicio_Model {
    late String codServicio;
    late String nombServicio;
    late String descServicio;
    late String tipoServicio;
    late String servidorPertenece;
    late int timeOut;

    Servicio_Model(this.codServicio, this.nombServicio, this.descServicio, 
    this.tipoServicio, this.servidorPertenece, this.timeOut);

    Map<String, dynamic> toJson() => {
        "codServicio": codServicio,
        "nombServicio": nombServicio,
        "descServicio": descServicio,
        "tipoServicio": tipoServicio,
        "servidorPertenece": servidorPertenece,
        "timeOut": timeOut,
    };
}
