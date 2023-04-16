import 'dart:convert';

String usuarioModelToJson(List<Servidor_Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servidor_Model {
  String codServidor;
  late String nombServidor;
  late String descServidor;
  late String userAdmiServidor;
  late String passServidor;

  Servidor_Model(this.codServidor, this.nombServidor, this.descServidor,
      this.userAdmiServidor, this.passServidor);

  Map<String, dynamic> toJson() => {
        "CodServidor": codServidor,
        "NombServidor": nombServidor,
        "DescServidor": descServidor,
        "UserAdmiServidor": userAdmiServidor,
        "PassServidor": passServidor,
      };
}//fin class
