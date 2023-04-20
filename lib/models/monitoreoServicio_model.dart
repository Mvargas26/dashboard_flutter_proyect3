import 'dart:convert';

String monitoreoServicioModelToJson(List<MonitoreoServicio_Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonitoreoServicio_Model {
  late String servidorPertenece;
  late String idServicio;
  late int estadoServicio;
  late DateTime fechaMoniServicio;
  late String estadoParam;
  late int timeOutServicio;

  MonitoreoServicio_Model(
      this.servidorPertenece,
      this.idServicio,
      this.estadoServicio,
      this.fechaMoniServicio,
      this.estadoParam,
      this.timeOutServicio);

  Map<String, dynamic> toJson() => {
        "servidorPertenece": servidorPertenece,
        "idServicio": idServicio,
        "estadoServicio": estadoServicio,
        "fechaMoniServicio": fechaMoniServicio,
        "estadoParam": estadoParam,
        "timeOutServicio": timeOutServicio,
      };
}//fin class
