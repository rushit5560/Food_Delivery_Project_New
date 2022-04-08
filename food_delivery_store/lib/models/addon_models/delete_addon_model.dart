// To parse this JSON data, do
//
//     final deleteAddonModel = deleteAddonModelFromJson(jsonString);

import 'dart:convert';

DeleteAddonModel deleteAddonModelFromJson(String str) => DeleteAddonModel.fromJson(json.decode(str));

String deleteAddonModelToJson(DeleteAddonModel data) => json.encode(data.toJson());

class DeleteAddonModel {
  DeleteAddonModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteAddonModel.fromJson(Map<String, dynamic> json) => DeleteAddonModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
