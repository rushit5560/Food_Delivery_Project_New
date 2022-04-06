// To parse this JSON data, do
//
//     final addSubCategoryModel = addSubCategoryModelFromJson(jsonString);

import 'dart:convert';

AddSubCategoryModel addSubCategoryModelFromJson(String str) => AddSubCategoryModel.fromJson(json.decode(str));

String addSubCategoryModelToJson(AddSubCategoryModel data) => json.encode(data.toJson());

class AddSubCategoryModel {
  AddSubCategoryModel({
    required this.status,
    required this.message,
    required this.subCategory,
  });

  bool status;
  String message;
  SubCategory subCategory;

  factory AddSubCategoryModel.fromJson(Map<String, dynamic> json) => AddSubCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    subCategory: SubCategory.fromJson(json["SubCategory"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "SubCategory": subCategory.toJson(),
  };
}

class SubCategory {
  SubCategory({
    required this.category,
    required this.restaurant,
    required this.name,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String category;
  String restaurant;
  String name;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    category: json["Category"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Category": category,
    "Restaurant": restaurant,
    "Name": name,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
