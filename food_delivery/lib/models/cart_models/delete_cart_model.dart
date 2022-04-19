import 'dart:convert';

DeleteCartModel deleteCartModelFromJson(String str) => DeleteCartModel.fromJson(json.decode(str));

String deleteCartModelToJson(DeleteCartModel data) => json.encode(data.toJson());

class DeleteCartModel {
  DeleteCartModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteCartModel.fromJson(Map<String, dynamic> json) => DeleteCartModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
