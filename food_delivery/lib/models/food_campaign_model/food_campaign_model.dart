// To parse this JSON data, do
//
//     final getFoodCampaignModel = getFoodCampaignModelFromJson(jsonString);

import 'dart:convert';

GetFoodCampaignModel getFoodCampaignModelFromJson(String str) => GetFoodCampaignModel.fromJson(json.decode(str));

String getFoodCampaignModelToJson(GetFoodCampaignModel data) => json.encode(data.toJson());

class GetFoodCampaignModel {
  GetFoodCampaignModel({
    required this.status,
    required this.message,
    required this.getList,
  });

  bool status;
  String message;
  List<GetList> getList;

  factory GetFoodCampaignModel.fromJson(Map<String, dynamic> json) => GetFoodCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    getList: List<GetList>.from(json["getList"].map((x) => GetList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetList {
  GetList({
    required this.itemType,
    required this.discountType,
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
    required this.foodImage,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Type itemType;
  Type discountType;
  String id;
  String title;
  SubCategory zone;
  Restaurant restaurant;
  String startDate;
  String endDate;
  String startTime;
  String endTime;
  String price;
  String discount;
  String category;
  SubCategory subCategory;
  List<Addon> attribute;
  List<Addon> addon;
  String description;
  String foodImage;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory GetList.fromJson(Map<String, dynamic> json) => GetList(
    itemType: Type.fromJson(json["ItemType"] ?? {}),
    discountType: Type.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    zone: SubCategory.fromJson(json["Zone"] ?? {}),
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    startDate: json["StartDate"] ?? "",
    endDate: json["EndDate"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    price: json["Price"] ?? "",
    discount: json["Discount"] ?? "",
    category: json["Category"] ?? "",
    subCategory: SubCategory.fromJson(json["SubCategory"] ?? {}),
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x)) ?? {}),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? {}),
    description: json["Description"] ?? "",
    foodImage: json["FoodImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "ItemType": itemType.toJson(),
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Title": title,
    "Zone": zone.toJson(),
    "Restaurant": restaurant.toJson(),
    "StartDate": startDate,
    "EndDate": endDate,
    "StartTime": startTime,
    "EndTime": endTime,
    "Price": price,
    "Discount": discount,
    "Category": category,
    "SubCategory": subCategory.toJson(),
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "Description": description,
    "FoodImage": foodImage,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  SubCategory value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: SubCategory.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value.toJson(),
    "label": label,
    "_id": id,
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.category,
    required this.image,
    required this.coordinates,
  });

  String id;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String category;
  String image;
  String coordinates;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    category: json["Category"] ?? "",
    image: json["Image"] ?? "",
    coordinates: json["Coordinates"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Category": category,
    "Image": image,
    "Coordinates": coordinates,
  };
}

class Type {
  Type({
    required this.value,
    required this.label,
  });

  String value;
  String label;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
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
    required this.numberOfReviews,
    required this.rating,
    required this.id,
    required this.storeName,
    required this.tax,
    required this.address,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.zone,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.isActive,
    required this.isApproved,
    required this.approvedOn,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.latitude,
    required this.longitude,
    required this.coverImage,
    required this.image,
    required this.campaignjoin,
  });

  int numberOfReviews;
  int rating;
  String id;
  String storeName;
  String tax;
  String address;
  String minDeliveryTime;
  String maxDeliveryTime;
  String zone;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  String startTime;
  String endTime;
  bool isActive;
  bool isApproved;
  String approvedOn;
  int v;
  String createdAt;
  String updatedAt;
  String latitude;
  String longitude;
  String coverImage;
  String image;
  List<dynamic> campaignjoin;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"] ?? 0,
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    tax: json["Tax"] ?? "",
    address: json["Address"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    zone: json["Zone"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    approvedOn: json["ApprovedOn"] ?? "",
    v: json["__v"] ?? 0,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    coverImage: json["CoverImage"] ?? "",
    image: json["Image"] ?? "",
    campaignjoin: List<dynamic>.from(json["campaignjoin"].map((x) => x) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
    "_id": id,
    "StoreName": storeName,
    "Tax": tax,
    "Address": address,
    "MinDeliveryTime": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime,
    "Zone": zone,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "ApprovedOn": approvedOn,
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "Latitude": latitude,
    "Longitude": longitude,
    "CoverImage": coverImage,
    "Image": image,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
  };
}
