// To parse this JSON data, do
//
//     final tipoDocumentoDto = tipoDocumentoDtoFromJson(jsonString);

import 'dart:convert';

TipoDocumentoDto tipoDocumentoDtoFromJson(String str) =>
    TipoDocumentoDto.fromJson(json.decode(str));

String tipoDocumentoDtoToJson(TipoDocumentoDto data) =>
    json.encode(data.toJson());

class TipoDocumentoDto {
  int id;
  String nombre;
  int longitud;

  TipoDocumentoDto({
    required this.id,
    required this.nombre,
    required this.longitud,
  });

  factory TipoDocumentoDto.fromJson(Map<String, dynamic> json) =>
      TipoDocumentoDto(
        id: json["id"],
        nombre: json["nombre"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "longitud": longitud,
      };
}
