// To parse this JSON data, do
//
//     final addAddonModel = addAddonModelFromJson(jsonString);

import 'dart:convert';

AddAddonModel addAddonModelFromJson(String str) => AddAddonModel.fromJson(json.decode(str));

String addAddonModelToJson(AddAddonModel data) => json.encode(data.toJson());

class AddAddonModel {
  AddAddonModel({
    required this.status,
    required this.message,
    required this.addon,
  });

  bool status;
  String message;
  Addon addon;

  factory AddAddonModel.fromJson(Map<String, dynamic> json) => AddAddonModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    addon: Addon.fromJson(json["addon"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "addon": addon.toJson(),
  };
}

class Addon {
  Addon({
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String restaurant;
  String name;
  String price;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Restaurant": restaurant,
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
