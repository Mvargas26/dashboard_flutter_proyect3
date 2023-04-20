// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

List<Login> loginFromJson(String str) => List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
    Login({
        required this.nombUser,
        required this.passUser,
    });

    String nombUser;
    String passUser;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        nombUser: json["nombUser"],
        passUser: json["passUser"],
    );

    Map<String, dynamic> toJson() => {
        "nombUser": nombUser,
        "passUser": passUser,
    };
}
