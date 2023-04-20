import 'dart:convert';


String servidorNombreToJson(List<ServidorNombre1> data) => 
json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class ServidorNombre1 {
   
    late String servidor;
    late String nombre;
    late String descripcion;
    late String administrador;
    late String contrasena;
    late String umbral;
    late String componente;
    late int porcentaje =0;

   
  ServidorNombre1(this.servidor, this.nombre, this.administrador,this.descripcion,
      this.contrasena, this.umbral, this.componente, this.porcentaje);

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
