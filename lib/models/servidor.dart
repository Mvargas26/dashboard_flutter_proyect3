// To parse this JSON data, do
//
//     final servidoresR = servidoresRFromJson(jsonString);

import 'dart:convert';

List<ServidoresR> servidoresRFromJson(String str) => List<ServidoresR>.from(json.decode(str).map((x) => ServidoresR.fromJson(x)));

String servidoresRToJson(List<ServidoresR> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServidoresR {
    ServidoresR({
        required this.codServidor,
        required this.nombServidor,
        required this.descServidor,
        required this.userAdmiServidor,
        required this.passServidor,
    });

    String codServidor;
    String nombServidor;
    String descServidor;
    String userAdmiServidor;
    String passServidor;

    factory ServidoresR.fromJson(Map<String, dynamic> json) => ServidoresR(
        codServidor: json["codServidor"],
        nombServidor: json["nombServidor"],
        descServidor: json["descServidor"],
        userAdmiServidor: json["userAdmiServidor"],
        passServidor: json["passServidor"],
    );

    Map<String, dynamic> toJson() => {
        "codServidor": codServidor,
        "nombServidor": nombServidor,
        "descServidor": descServidor,
        "userAdmiServidor": userAdmiServidor,
        "passServidor": passServidor,
    };
}
