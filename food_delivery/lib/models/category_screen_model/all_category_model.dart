// To parse this JSON data, do
//
//     final allCategoryModel = allCategoryModelFromJson(jsonString);

import 'dart:convert';

AllCategoryModel allCategoryModelFromJson(String str) => AllCategoryModel.fromJson(json.decode(str));

String allCategoryModelToJson(AllCategoryModel data) => json.encode(data.toJson());

class AllCategoryModel {
  AllCategoryModel({
    required this.status,
    required this.message,
    required this.allCategory,
  });

  bool status;
  String message;
  List<AllCategory> allCategory;

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) => AllCategoryModel(
    status: json["status"],
    message: json["message"] == null ? "" : json["message"],
    allCategory: List<AllCategory>.from(json["allCategory"].map((x) => AllCategory.fromJson(x))).isEmpty ? [] : List<AllCategory>.from(json["allCategory"].map((x) => AllCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message.isEmpty ? "" : message,
    "allCategory": List<dynamic>.from(allCategory.map((x) => x.toJson())).length == 0 ? [] : List<dynamic>.from(allCategory.map((x) => x.toJson())),
  };
}

class AllCategory {
  AllCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String image;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
    id: json["_id"] == null ? "" : json["_id"],
    name: json["Name"] == null ? "" : json["Name"],
    image: json["Image"] == null ? "" : json["Image"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.isEmpty ? "" : id,
    "Name": name.isEmpty ? "" : name,
    "Image": image.isEmpty ? "" : image,
    "IsActive": isActive.toString().isEmpty ? false : isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v.toString().isEmpty ? 0 : v,
  };
}
