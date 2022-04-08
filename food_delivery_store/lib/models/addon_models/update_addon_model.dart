// To parse this JSON data, do
//
//     final updateAddonModel = updateAddonModelFromJson(jsonString);

import 'dart:convert';

UpdateAddonModel updateAddonModelFromJson(String str) => UpdateAddonModel.fromJson(json.decode(str));

String updateAddonModelToJson(UpdateAddonModel data) => json.encode(data.toJson());

class UpdateAddonModel {
  UpdateAddonModel({
    required this.status,
    required this.msg,
    required this.updateaddon1,
  });

  bool status;
  String msg;
  Updateaddon1 updateaddon1;

  factory UpdateAddonModel.fromJson(Map<String, dynamic> json) => UpdateAddonModel(
    status: json["status"] ?? false,
    msg: json["msg"] ?? "",
    updateaddon1: Updateaddon1.fromJson(json["updateaddon"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "updateaddon": updateaddon1.toJson(),
  };
}

class Updateaddon1 {
  Updateaddon1({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Updateaddon1.fromJson(Map<String, dynamic> json) => Updateaddon1(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant,
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
