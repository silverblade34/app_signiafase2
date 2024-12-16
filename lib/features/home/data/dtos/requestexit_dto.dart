// To parse this JSON data, do
//
//     final requestExitDto = requestExitDtoFromJson(jsonString);

import 'dart:convert';

List<RequestExitDto> requestExitDtoFromJson(String str) => List<RequestExitDto>.from(json.decode(str).map((x) => RequestExitDto.fromJson(x)));

String requestExitDtoToJson(List<RequestExitDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestExitDto {
    int id;
    String placa;
    String origen;
    String estado;
    String comentarios;
    DateTime fechacierre;
    int? clavesalida;
    bool flagexteriores;

    RequestExitDto({
        required this.id,
        required this.placa,
        required this.origen,
        required this.estado,
        required this.comentarios,
        required this.fechacierre,
      this.clavesalida,
        required this.flagexteriores,
    });

    factory RequestExitDto.fromJson(Map<String, dynamic> json) => RequestExitDto(
        id: json["id"],
        placa: json["placa"],
        origen: json["origen"],
        estado: json["estado"],
        comentarios: json["comentarios"],
        fechacierre: DateTime.parse(json["fechacierre"]),
      clavesalida: json["clavesalida"],
        flagexteriores: json["flagexteriores"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "placa": placa,
        "origen": origen,
        "estado": estado,
        "comentarios": comentarios,
        "fechacierre": fechacierre.toIso8601String(),
        "clavesalida": clavesalida,
        "flagexteriores": flagexteriores,
    };
}
