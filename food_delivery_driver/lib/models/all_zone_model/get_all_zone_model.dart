import 'dart:convert';

GetAllZoneModel getAllZoneModelFromJson(String str) => GetAllZoneModel.fromJson(json.decode(str));

String getAllZoneModelToJson(GetAllZoneModel data) => json.encode(data.toJson());

class GetAllZoneModel {
  GetAllZoneModel({
    required this.status,
    required this.message,
    required this.allZone,
  });

  bool status;
  String message;
  List<AllZone> allZone;

  factory GetAllZoneModel.fromJson(Map<String, dynamic> json) => GetAllZoneModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    allZone: List<AllZone>.from(json["allZone"].map((x) => AllZone.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "allZone": List<dynamic>.from(allZone.map((x) => x.toJson())),
  };
}

class AllZone {
  AllZone({
    this.id,
    this.name,
    this.coordinates,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  String? coordinates;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  factory AllZone.fromJson(Map<String, dynamic> json) => AllZone(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    coordinates: json["Coordinates"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Coordinates": coordinates,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
