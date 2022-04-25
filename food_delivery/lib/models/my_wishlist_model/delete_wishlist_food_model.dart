import 'dart:convert';

DeleteWishlistFoodModel deleteWishlistFoodModelFromJson(String str) => DeleteWishlistFoodModel.fromJson(json.decode(str));

String deleteWishlistFoodModelToJson(DeleteWishlistFoodModel data) => json.encode(data.toJson());

class DeleteWishlistFoodModel {
  DeleteWishlistFoodModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteWishlistFoodModel.fromJson(Map<String, dynamic> json) => DeleteWishlistFoodModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}