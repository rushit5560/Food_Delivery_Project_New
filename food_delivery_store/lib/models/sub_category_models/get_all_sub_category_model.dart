// To parse this JSON data, do
//
//     final getAllSubCategoryModel = getAllSubCategoryModelFromJson(jsonString);

import 'dart:convert';

GetAllSubCategoryModel getAllSubCategoryModelFromJson(String str) => GetAllSubCategoryModel.fromJson(json.decode(str));

String getAllSubCategoryModelToJson(GetAllSubCategoryModel data) => json.encode(data.toJson());

class GetAllSubCategoryModel {
  GetAllSubCategoryModel({
    required this.status,
    required this.message,
    required this.allSubcategory,
  });

  bool status;
  String message;
  List<AllSubcategory> allSubcategory;

  factory GetAllSubCategoryModel.fromJson(Map<String, dynamic> json) => GetAllSubCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    allSubcategory: List<AllSubcategory>.from(json["allSubcategory"].map((x) => AllSubcategory.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "allSubcategory": List<dynamic>.from(allSubcategory.map((x) => x.toJson())),
  };
}

class AllSubcategory {
  AllSubcategory({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.category,
    required this.restaurant,
  });

  String id;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  Category category;
  Restaurant restaurant;

  factory AllSubcategory.fromJson(Map<String, dynamic> json) => AllSubcategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    category: Category.fromJson(json["Category"] ?? {}),
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Category": category.toJson(),
    "Restaurant": restaurant.toJson(),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String restaurant;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant,
    "Image": image,
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
