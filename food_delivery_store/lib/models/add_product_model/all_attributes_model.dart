// To parse this JSON data, do
//
//     final allAttributesModule = allAttributesModuleFromJson(jsonString);

import 'dart:convert';

AllAttributesModule allAttributesModuleFromJson(String str) => AllAttributesModule.fromJson(json.decode(str));

String allAttributesModuleToJson(AllAttributesModule data) => json.encode(data.toJson());

class AllAttributesModule {
  AllAttributesModule({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElement1> list;

  factory AllAttributesModule.fromJson(Map<String, dynamic> json) => AllAttributesModule(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<ListElement1>.from(json["List"].map((x) => ListElement1.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement1 {
  ListElement1({
    this.id,
    this.name,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  factory ListElement1.fromJson(Map<String, dynamic> json) => ListElement1(
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
