// To parse this JSON data, do
//
//     final getAllAddonModel = getAllAddonModelFromJson(jsonString);

import 'dart:convert';

GetAllAddonModel getAllAddonModelFromJson(String str) => GetAllAddonModel.fromJson(json.decode(str));

String getAllAddonModelToJson(GetAllAddonModel data) => json.encode(data.toJson());

class GetAllAddonModel {
  GetAllAddonModel({
    required this.status,
    required this.message,
    required this.addon,
  });

  bool status;
  String message;
  List<AddonAll> addon;

  factory GetAllAddonModel.fromJson(Map<String, dynamic> json) => GetAllAddonModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    addon: List<AddonAll>.from(json["Addon"].map((x) => AddonAll.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
  };
}

class AddonAll {
  AddonAll({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  Restaurant restaurant;
  String name;
  String price;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory AddonAll.fromJson(Map<String, dynamic> json) => AddonAll(
    id: json["_id"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant.toJson(),
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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
  String startTime;
  String endTime;
  String image;
  String coverImage;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  String approvedOn;
  String createdAt;
  String updatedAt;
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
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ?? "",
    coverImage: json["CoverImage"] ?? "",
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
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
    "StartTime": startTime,
    "EndTime": endTime,
    "Image": image,
    "CoverImage": coverImage,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
