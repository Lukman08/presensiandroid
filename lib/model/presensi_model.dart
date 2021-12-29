// To parse this JSON data, do
//
//     final presensiModel = presensiModelFromJson(jsonString);

import 'dart:convert';

PresensiModel presensiModelFromJson(String str) =>
    PresensiModel.fromJson(json.decode(str));

String presensiModelToJson(PresensiModel data) => json.encode(data.toJson());

class PresensiModel {
  PresensiModel({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory PresensiModel.fromJson(Map<String, dynamic> json) => PresensiModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.pengisi,
    this.nama,
    this.kelas,
    this.kehadiran,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String pengisi;
  String nama;
  String kelas;
  String kehadiran;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        pengisi: json["pengisi"],
        nama: json["nama"],
        kelas: json["kelas"],
        kehadiran: json["kehadiran"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pengisi": pengisi,
        "nama": nama,
        "kelas": kelas,
        "kehadiran": kehadiran,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
