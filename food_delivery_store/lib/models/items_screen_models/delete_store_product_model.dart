// To parse this JSON data, do
//
//     final deleteStoreProductModel = deleteStoreProductModelFromJson(jsonString);

import 'dart:convert';

DeleteStoreProductModel deleteStoreProductModelFromJson(String str) => DeleteStoreProductModel.fromJson(json.decode(str));

String deleteStoreProductModelToJson(DeleteStoreProductModel data) => json.encode(data.toJson());

class DeleteStoreProductModel {
  DeleteStoreProductModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteStoreProductModel.fromJson(Map<String, dynamic> json) => DeleteStoreProductModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
