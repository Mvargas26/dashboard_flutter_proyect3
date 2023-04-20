

import 'dart:convert';

List<ServidorNombre> servidorNombreFromJson(String str) => List<ServidorNombre>.from(json.decode(str).map((x) => ServidorNombre.fromJson(x)));

String servidorNombreToJson(List<ServidorNombre> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServidorNombre {
    ServidorNombre({
        required this.servidor,
        required this.nombre,
        required this.descripcion,
        required this.administrador,
        required this.contrasena,
        required this.umbral,
        required this.componente,
        required this.porcentaje,
    });

    String servidor;
    String nombre;
    String descripcion;
    String administrador;
    String contrasena;
    String umbral;
    String componente;
    int porcentaje =0;

    factory ServidorNombre.fromJson(Map<String, dynamic> json) => ServidorNombre(
        servidor: json["servidor"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        administrador: json["administrador"],
        contrasena: json["contrasena"],
        umbral: json["umbral"],
        componente: json["componente"],
        porcentaje: json["porcentaje"],
    );

    Map<String, dynamic> toJson() => {
        "servidor": servidor,
        "nombre": nombre,
        "descripcion": descripcion,
        "administrador": administrador,
        "contrasena": contrasena,
        "umbral": umbral,
        "componente": componente,
        "porcentaje": porcentaje,
    };
}
