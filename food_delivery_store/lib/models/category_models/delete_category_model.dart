// To parse this JSON data, do
//
//     final deleteCategoryModel = deleteCategoryModelFromJson(jsonString);

import 'dart:convert';

DeleteCategoryModel deleteCategoryModelFromJson(String str) => DeleteCategoryModel.fromJson(json.decode(str));

String deleteCategoryModelToJson(DeleteCategoryModel data) => json.encode(data.toJson());

class DeleteCategoryModel {
  DeleteCategoryModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteCategoryModel.fromJson(Map<String, dynamic> json) => DeleteCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
