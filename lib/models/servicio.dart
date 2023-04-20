// To parse this JSON data, do
//
//     final servicio = servicioFromJson(jsonString);

import 'dart:convert';

List<Servicio> servicioFromJson(String str) => List<Servicio>.from(json.decode(str).map((x) => Servicio.fromJson(x)));

String servicioToJson(List<Servicio> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servicio {
    Servicio({
        required this.codServicio,
        required this.nombServicio,
        required this.descServicio,
        required this.tipoServicio,
        required this.servidorPertenece,
        required this.timeOut,
    });

    String codServicio;
    String nombServicio;
    String descServicio;
    String tipoServicio;
    String servidorPertenece;
    int timeOut;

    factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        codServicio: json["codServicio"],
        nombServicio: json["nombServicio"],
        descServicio: json["descServicio"],
        tipoServicio: json["tipoServicio"],
        servidorPertenece: json["servidorPertenece"],
        timeOut: json["timeOut"],
    );

    Map<String, dynamic> toJson() => {
        "codServicio": codServicio,
        "nombServicio": nombServicio,
        "descServicio": descServicio,
        "tipoServicio": tipoServicio,
        "servidorPertenece": servidorPertenece,
        "timeOut": timeOut,
    };
}
