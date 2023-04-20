import 'dart:convert';

String servicioModelToJson(List<Servicio_Modelo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servicio_Modelo {
  late String codServicio;
  late String nombServicio;
  late String descServicio;
  late String tipoServicio;
  late String servidorPertenece;
  late int timeOut;

  Servicio_Modelo(this.codServicio, this.nombServicio, this.descServicio,
      this.tipoServicio, this.servidorPertenece, this.timeOut);

  Map<String, dynamic> toJson() => {
        "codServicio": codServicio,
        "nombServicio": nombServicio,
        "descServicio": descServicio,
        "tipoServicio": tipoServicio,
        "servidorPertenece": servidorPertenece,
        "timeOut": timeOut,
      };
}//fin class
