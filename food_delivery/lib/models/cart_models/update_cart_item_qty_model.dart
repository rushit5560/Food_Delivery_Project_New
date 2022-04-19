// To parse this JSON data, do
//
//     final updateCartItemQtyModel = updateCartItemQtyModelFromJson(jsonString);

import 'dart:convert';

UpdateCartItemQtyModel updateCartItemQtyModelFromJson(String str) => UpdateCartItemQtyModel.fromJson(json.decode(str));

String updateCartItemQtyModelToJson(UpdateCartItemQtyModel data) => json.encode(data.toJson());

class UpdateCartItemQtyModel {
  UpdateCartItemQtyModel({
    required this.status,
    required this.message,
    required this.cartItem,
  });

  bool status;
  String message;
  UpdateCartItem cartItem;

  factory UpdateCartItemQtyModel.fromJson(Map<String, dynamic> json) => UpdateCartItemQtyModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    cartItem: UpdateCartItem.fromJson(json["CartItem"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "CartItem": cartItem.toJson(),
  };
}

class UpdateCartItem {
  UpdateCartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.productQuantity,
    required this.productPrice,
    required this.itemTotalPrice,
    required this.addonTotalPrice,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cartId;
  String productId;
  int productQuantity;
  int productPrice;
  int itemTotalPrice;
  int addonTotalPrice;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory UpdateCartItem.fromJson(Map<String, dynamic> json) => UpdateCartItem(
    id: json["_id"] ?? "",
    cartId: json["CartId"] ?? "",
    productId: json["ProductId"] ?? "",
    productQuantity: json["ProductQuantity"] ?? 0,
    productPrice: json["ProductPrice"] ?? 0,
    itemTotalPrice: json["ItemTotalPrice"] ?? 0,
    addonTotalPrice: json["AddonTotalPrice"] ?? 0,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CartId": cartId,
    "ProductId": productId,
    "ProductQuantity": productQuantity,
    "ProductPrice": productPrice,
    "ItemTotalPrice": itemTotalPrice,
    "AddonTotalPrice": addonTotalPrice,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
