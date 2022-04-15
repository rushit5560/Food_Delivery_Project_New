// To parse this JSON data, do
//
//     final createCartModel = createCartModelFromJson(jsonString);

import 'dart:convert';

CreateCartModel createCartModelFromJson(String str) => CreateCartModel.fromJson(json.decode(str));

String createCartModelToJson(CreateCartModel data) => json.encode(data.toJson());

class CreateCartModel {
  CreateCartModel({
    required this.status,
    required this.message,
    required this.cart,
  });

  bool status;
  String message;
  Cart cart;

  factory CreateCartModel.fromJson(Map<String, dynamic> json) => CreateCartModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    cart: Cart.fromJson(json["Cart"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Cart": cart.toJson(),
  };
}

class Cart {
  Cart({
    required this.userId,
    required this.restaurantId,
    required this.quantity,
    required this.subTotal,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String userId;
  String restaurantId;
  int quantity;
  int subTotal;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    userId: json["UserId"] ?? "",
    restaurantId: json["RestaurantId"] ?? "",
    quantity: json["Quantity"] ?? 0,
    subTotal: json["SubTotal"] ?? 0,
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "RestaurantId": restaurantId,
    "Quantity": quantity,
    "SubTotal": subTotal,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
