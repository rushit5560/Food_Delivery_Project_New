// To parse this JSON data, do
//
//     final foodCampaignModel = foodCampaignModelFromJson(jsonString);

import 'dart:convert';

FoodCampaignModel foodCampaignModelFromJson(String str) => FoodCampaignModel.fromJson(json.decode(str));

String foodCampaignModelToJson(FoodCampaignModel data) => json.encode(data.toJson());

class FoodCampaignModel {
  FoodCampaignModel({
    required this.status,
    required this.message,
    required this.getList,
  });

  bool status;
  String message;
  List<GetFoodCampList> getList;

  factory FoodCampaignModel.fromJson(Map<String, dynamic> json) => FoodCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    getList: List<GetFoodCampList>.from(json["getList"].map((x) => GetFoodCampList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetFoodCampList {
  GetFoodCampList({
    required this.id,
    required this.title,
    required this.zone,
    required this.restaurant,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.discount,
    required this.category,
    required this.subCategory,
    required this.attribute,
    required this.addon,
    required this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.discountType,
    required this.foodImage,
  });

  String id;
  String title;
  Zone zone;
  Restaurant restaurant;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  String price;
  String discount;
  String category;
  String subCategory;
  List<Addon> attribute;
  List<Addon> addon;
  String description;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DiscountType discountType;
  String foodImage;

  factory GetFoodCampList.fromJson(Map<String, dynamic> json) => GetFoodCampList(
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    zone: Zone.fromJson(json["Zone"] ?? {}),
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    startDate: DateTime.parse(json["StartDate"] ?? DateTime.now()),
    endDate: DateTime.parse(json["EndDate"] ?? DateTime.now()),
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    price: json["Price"] ?? "",
    discount: json["Discount"] ?? "",
    category: json["Category"] ?? "",
    subCategory: json["SubCategory"] ?? "",
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x)) ?? []),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? []),
    description: json["Description"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    discountType: DiscountType.fromJson(json["DiscountType"] ?? {}),
    foodImage: json["FoodImage"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "Zone": zone.toJson(),
    "Restaurant": restaurant.toJson(),
    "StartDate": startDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
    "StartTime": startTime,
    "EndTime": endTime,
    "Price": price,
    "Discount": discount,
    "Category": category,
    "SubCategory": subCategory,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "Description": description,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "DiscountType": discountType == null ? null : discountType.toJson(),
    "FoodImage": foodImage == null ? null : foodImage,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  Zone value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: Zone.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}

class Zone {
  Zone({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.coordinates,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String coordinates;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    coordinates: json["Coordinates"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant == null ? null : restaurant,
    "Name": name,
    "Price": price == null ? null : price,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Coordinates": coordinates == null ? null : coordinates,
  };
}

class DiscountType {
  DiscountType({
    required this.value,
    required this.label,
  });

  String value;
  String label;

  factory DiscountType.fromJson(Map<String, dynamic> json) => DiscountType(
    value: json["value"] ?? "",
    label: json["label"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.storeName,
    required this.tax,
    required this.address,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.zone,
    required this.latitude,
    required this.longitude,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
    required this.createdBy,
    required this.updatedBy,
  });

  String id;
  String storeName;
  String tax;
  String address;
  String minDeliveryTime;
  String maxDeliveryTime;
  String zone;
  String latitude;
  String longitude;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  String startTime;
  String endTime;
  String roleId;
  bool isActive;
  bool isApproved;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String image;
  String createdBy;
  String updatedBy;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    tax: json["Tax"] ?? "",
    address: json["Address"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    zone: json["Zone"] ?? "",
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    approvedOn: DateTime.parse(json["ApprovedOn"] ?? DateTime.now()),
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    image: json["Image"]?? "",
    createdBy: json["CreatedBy"]?? "",
    updatedBy: json["UpdatedBy"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Tax": tax,
    "Address": address,
    "MinDeliveryTime": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime,
    "Zone": zone,
    "Latitude": latitude,
    "Longitude": longitude,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Image": image == null ? null : image,
    "CreatedBy": createdBy == null ? null : createdBy,
    "UpdatedBy": updatedBy == null ? null : updatedBy,
  };
}
