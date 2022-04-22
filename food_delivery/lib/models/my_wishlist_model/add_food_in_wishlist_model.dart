import 'dart:convert';

AddFoodInWishlistModel addFoodInWishlistModelFromJson(String str) => AddFoodInWishlistModel.fromJson(json.decode(str));

String addFoodInWishlistModelToJson(AddFoodInWishlistModel data) => json.encode(data.toJson());

class AddFoodInWishlistModel {
  AddFoodInWishlistModel({
    required this.status,
    required this.message,
    required this.wishlist,
  });

  bool status;
  String message;
  Wishlist wishlist;

  factory AddFoodInWishlistModel.fromJson(Map<String, dynamic> json) => AddFoodInWishlistModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    wishlist: Wishlist.fromJson(json["Wishlist"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Wishlist": wishlist.toJson(),
  };
}

class Wishlist {
  Wishlist({
    required this.userId,
    required this.restaurantId,
    required this.productId,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String userId;
  String restaurantId;
  String productId;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    userId: json["UserId"] ?? "",
    restaurantId: json["RestaurantId"] ?? "",
    productId: json["ProductId"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "RestaurantId": restaurantId,
    "ProductId": productId,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
