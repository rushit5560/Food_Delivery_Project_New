

import 'dart:convert';

GetSubCategoryModel getSubCategoryModelFromJson(String str) => GetSubCategoryModel.fromJson(json.decode(str));

String getSubCategoryModelToJson(GetSubCategoryModel data) => json.encode(data.toJson());

class GetSubCategoryModel {
  GetSubCategoryModel({
    required this.status,
    required this.subcategory,
  });

  bool status;
  List<SubCategory1> subcategory;

  factory GetSubCategoryModel.fromJson(Map<String, dynamic> json) => GetSubCategoryModel(
    status: json["status"] ?? false,
    subcategory: List<SubCategory1>.from(json["subcategory"].map((x) => SubCategory1.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
  };
}

class SubCategory1 {
  SubCategory1({
    this.id,
    this.category,
    this.restaurant,
    this.name,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  MainCategory? category;
  String? restaurant;
  String? name;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory SubCategory1.fromJson(Map<String, dynamic> json) => SubCategory1(
    id: json["_id"] ?? "",
    category: MainCategory.fromJson(json["Category"] ?? {}),
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category!.toJson(),
    "Restaurant": restaurant,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}


class MainCategory {
  MainCategory({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String restaurant;
  String image;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

