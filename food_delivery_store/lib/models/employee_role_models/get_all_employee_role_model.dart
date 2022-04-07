// To parse this JSON data, do
//
//     final getEmployeeRoleModel = getEmployeeRoleModelFromJson(jsonString);

import 'dart:convert';

GetEmployeeRoleModel getEmployeeRoleModelFromJson(String str) => GetEmployeeRoleModel.fromJson(json.decode(str));

String getEmployeeRoleModelToJson(GetEmployeeRoleModel data) => json.encode(data.toJson());

class GetEmployeeRoleModel {
  GetEmployeeRoleModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElementRole> list;

  factory GetEmployeeRoleModel.fromJson(Map<String, dynamic> json) => GetEmployeeRoleModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<ListElementRole>.from(json["List"].map((x) => ListElementRole.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElementRole {
  ListElementRole({
    this.permission,
    this.id,
    this.name,
    this.store,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Map<String, bool>? permission;
  String? id;
  String? name;
  String? store;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  factory ListElementRole.fromJson(Map<String, dynamic> json) => ListElementRole(
    permission: Map.from(json["Permission"] ?? {}).map((k, v) => MapEntry<String, bool>(k, v)),
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    store: json["Store"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Permission": Map.from(permission!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "_id": id,
    "Name": name,
    "Store": store,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
