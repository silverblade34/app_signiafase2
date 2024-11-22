// To parse this JSON data, do
//
//     final destinoDto = destinoDtoFromJson(jsonString);

import 'dart:convert';

DestinoDto destinoDtoFromJson(String str) => DestinoDto.fromJson(json.decode(str));

String destinoDtoToJson(DestinoDto data) => json.encode(data.toJson());

class DestinoDto {
    int id;
    dynamic ruc;
    String nombre;
    bool flagvalidaws;
    bool flagisBase;
    bool flagapp;
    dynamic fechacreacion;
    bool estado;

    DestinoDto({
        required this.id,
        required this.ruc,
        required this.nombre,
        required this.flagvalidaws,
        required this.flagisBase,
        required this.flagapp,
        required this.fechacreacion,
        required this.estado,
    });

    factory DestinoDto.fromJson(Map<String, dynamic> json) => DestinoDto(
        id: json["id"],
        ruc: json["ruc"],
        nombre: json["nombre"],
        flagvalidaws: json["flagvalidaws"],
        flagisBase: json["flagisBase"],
        flagapp: json["flagapp"],
        fechacreacion: json["fechacreacion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ruc": ruc,
        "nombre": nombre,
        "flagvalidaws": flagvalidaws,
        "flagisBase": flagisBase,
        "flagapp": flagapp,
        "fechacreacion": fechacreacion,
        "estado": estado,
    };
}
