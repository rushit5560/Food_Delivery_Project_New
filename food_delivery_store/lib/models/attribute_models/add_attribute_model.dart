// To parse this JSON data, do
//
//     final addAttributeModel = addAttributeModelFromJson(jsonString);

import 'dart:convert';

AddAttributeModel addAttributeModelFromJson(String str) => AddAttributeModel.fromJson(json.decode(str));

String addAttributeModelToJson(AddAttributeModel data) => json.encode(data.toJson());

class AddAttributeModel {
  AddAttributeModel({
    required this.status,
    required this.message,
    required this.attributes,
  });

  bool status;
  String message;
  Attributes attributes;

  factory AddAttributeModel.fromJson(Map<String, dynamic> json) => AddAttributeModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    attributes: Attributes.fromJson(json["attributes"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes({
    required this.name,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String name;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
