// To parse this JSON data, do
//
//     final deleteDeliveryManModel = deleteDeliveryManModelFromJson(jsonString);

import 'dart:convert';

DeleteDeliveryManModel deleteDeliveryManModelFromJson(String str) => DeleteDeliveryManModel.fromJson(json.decode(str));

String deleteDeliveryManModelToJson(DeleteDeliveryManModel data) => json.encode(data.toJson());

class DeleteDeliveryManModel {
  DeleteDeliveryManModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteDeliveryManModel.fromJson(Map<String, dynamic> json) => DeleteDeliveryManModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
