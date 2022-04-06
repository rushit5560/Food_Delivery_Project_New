// To parse this JSON data, do
//
//     final getAllAttributeModel = getAllAttributeModelFromJson(jsonString);

import 'dart:convert';

GetAllAttributeModel getAllAttributeModelFromJson(String str) => GetAllAttributeModel.fromJson(json.decode(str));

String getAllAttributeModelToJson(GetAllAttributeModel data) => json.encode(data.toJson());

class GetAllAttributeModel {
  GetAllAttributeModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElementAll> list;

  factory GetAllAttributeModel.fromJson(Map<String, dynamic> json) => GetAllAttributeModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<ListElementAll>.from(json["List"].map((x) => ListElementAll.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElementAll {
  ListElementAll({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ListElementAll.fromJson(Map<String, dynamic> json) => ListElementAll(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
