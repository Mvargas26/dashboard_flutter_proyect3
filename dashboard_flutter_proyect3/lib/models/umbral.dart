import 'dart:convert';

List<Umbral> umbralFromJson(String str) => List<Umbral>.from(json.decode(str).map((x) => Umbral.fromJson(x)));

String umbralToJson(List<Umbral> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Umbral {
    Umbral({
        required this.codServer,
        required this.codUmbral,
        required this.codComp,
        required this.porcentaje,
    });

    String codServer;
    String codUmbral;
    String codComp;
    int porcentaje;

    factory Umbral.fromJson(Map<String, dynamic> json) => Umbral(
        codServer: json["codServer"],
        codUmbral: json["codUmbral"],
        codComp: json["codComp"],
        porcentaje: json["porcentaje"],
    );

    Map<String, dynamic> toJson() => {
        "codServer": codServer,
        "codUmbral": codUmbral,
        "codComp": codComp,
        "porcentaje": porcentaje,
    };
}
