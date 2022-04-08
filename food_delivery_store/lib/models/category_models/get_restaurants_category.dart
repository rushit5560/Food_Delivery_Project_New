// To parse this JSON data, do
//
//     final getRestaurantCategoryModel = getRestaurantCategoryModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantCategoryModel getRestaurantCategoryModelFromJson(String str) => GetRestaurantCategoryModel.fromJson(json.decode(str));

String getRestaurantCategoryModelToJson(GetRestaurantCategoryModel data) => json.encode(data.toJson());

class GetRestaurantCategoryModel {
  GetRestaurantCategoryModel({
    required this.status,
    required this.category,
  });

  bool status;
  List<RestaurantCategory> category;

  factory GetRestaurantCategoryModel.fromJson(Map<String, dynamic> json) => GetRestaurantCategoryModel(
    status: json["status"] ?? false,
    category: List<RestaurantCategory>.from(json["category"].map((x) => RestaurantCategory.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class RestaurantCategory {
  RestaurantCategory({
    this.id,
    this.name,
    this.restaurant,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  Restaurant? restaurant;
  String? image;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory RestaurantCategory.fromJson(Map<String, dynamic> json) => RestaurantCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant!.toJson(),
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.storeName,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.image,
    required this.coverImage,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String storeName;
  String address;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  DateTime startTime;
  DateTime endTime;
  String image;
  String coverImage;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    address: json["Address"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: DateTime.parse(json["StartTime"] ?? DateTime.now()),
    endTime: DateTime.parse(json["EndTime"] ?? DateTime.now()),
    image: json["Image"] ?? "",
    coverImage: json["CoverImage"] ?? "",
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: DateTime.parse(json["ApprovedOn"] ?? DateTime.now()),
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Address": address,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime.toIso8601String(),
    "EndTime": endTime.toIso8601String(),
    "Image": image,
    "CoverImage": coverImage,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
