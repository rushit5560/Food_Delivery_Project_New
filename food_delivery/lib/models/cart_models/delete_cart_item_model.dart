import 'dart:convert';

DeleteCartItemModel deleteCartItemModelFromJson(String str) => DeleteCartItemModel.fromJson(json.decode(str));

String deleteCartItemModelToJson(DeleteCartItemModel data) => json.encode(data.toJson());

class DeleteCartItemModel {
  DeleteCartItemModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteCartItemModel.fromJson(Map<String, dynamic> json) => DeleteCartItemModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

