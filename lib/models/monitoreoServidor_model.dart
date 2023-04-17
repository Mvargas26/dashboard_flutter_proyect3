import 'dart:convert';

String monitoreoServidorModelToJson(List<MonitoreoServidor_Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonitoreoServidor_Model {
  String servidor;
  late String nombre;
  late DateTime fechaMonitoreo;
  late int cpu;
  late int memoria;
  late int espacio;
  late String estado;

  MonitoreoServidor_Model(this.servidor, this.nombre, this.fechaMonitoreo,
      this.cpu, this.memoria, this.espacio, this.estado);

  Map<String, dynamic> toJson() => {
        "servidor": servidor,
        "nombre": nombre,
        "fechaMonitoreo": fechaMonitoreo,
        "cpu": cpu,
        "usoMemoria": memoria,
        "espacio": espacio,
        "estado": estado,
      };
}//fin class
