// To parse this JSON data, do
//
//     final updateSubCategoryModel = updateSubCategoryModelFromJson(jsonString);

import 'dart:convert';

UpdateSubCategoryModel updateSubCategoryModelFromJson(String str) => UpdateSubCategoryModel.fromJson(json.decode(str));

String updateSubCategoryModelToJson(UpdateSubCategoryModel data) => json.encode(data.toJson());

class UpdateSubCategoryModel {
  UpdateSubCategoryModel({
    required this.status,
    required this.message,
    required this.updatesubcategory,
  });

  bool status;
  String message;
  Updatesubcategory updatesubcategory;

  factory UpdateSubCategoryModel.fromJson(Map<String, dynamic> json) => UpdateSubCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    updatesubcategory: Updatesubcategory.fromJson(json["updatesubcategory"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "updatesubcategory": updatesubcategory.toJson(),
  };
}

class Updatesubcategory {
  Updatesubcategory({
    required this.id,
    required this.category,
    required this.restaurant,
    required this.name,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String category;
  String restaurant;
  String name;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Updatesubcategory.fromJson(Map<String, dynamic> json) => Updatesubcategory(
    id: json["_id"] ?? "",
    category: json["Category"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category,
    "Restaurant": restaurant,
    "Name": name,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
