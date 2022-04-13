// To parse this JSON data, do
//
//     final getAllCampaignModel = getAllCampaignModelFromJson(jsonString);

import 'dart:convert';

GetAllCampaignModel getAllCampaignModelFromJson(String str) => GetAllCampaignModel.fromJson(json.decode(str));

String getAllCampaignModelToJson(GetAllCampaignModel data) => json.encode(data.toJson());

class GetAllCampaignModel {
  GetAllCampaignModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<CampaignListElement> list;

  factory GetAllCampaignModel.fromJson(Map<String, dynamic> json) => GetAllCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<CampaignListElement>.from(json["List"].map((x) => CampaignListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class CampaignListElement {
  CampaignListElement({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.dailyStartTime,
    required this.description,
    required this.campaignImage,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.dailyEndTime,
    required this.restaurant,
  });

  String id;
  String title;
  String startDate;
  String endDate;
  String dailyStartTime;
  String description;
  String campaignImage;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String dailyEndTime;
  Restaurant restaurant;

  factory CampaignListElement.fromJson(Map<String, dynamic> json) => CampaignListElement(
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    startDate: json["StartDate"] ?? "",
    endDate: json["EndDate"] ?? "",
    dailyStartTime: json["DailyStartTime"] ?? "",
    description: json["Description"] ?? "",
    campaignImage: json["CampaignImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    dailyEndTime: json["DailyEndTime"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "StartDate": startDate,
    "EndDate": endDate,
    "DailyStartTime": dailyStartTime,
    "Description": description,
    "CampaignImage": campaignImage,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "DailyEndTime": dailyEndTime,
    "Restaurant": restaurant.toJson(),
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
    required this.latitude,
    required this.longitude,
    required this.maxDeliveryTime,
    required this.minDeliveryTime,
    required this.tax,
    required this.zone,
    required this.numberOfReviews,
    required this.rating,
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
  String latitude;
  String longitude;
  String maxDeliveryTime;
  String minDeliveryTime;
  String tax;
  String zone;
  int numberOfReviews;
  double rating;

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
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    tax: json["Tax"] ?? "",
    zone: json["Zone"] ?? "",
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toDouble() ?? 0.0,
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
    "Latitude": latitude,
    "Longitude": longitude,
    "MaxDeliveryTime": maxDeliveryTime,
    "MinDeliveryTime": minDeliveryTime,
    "Tax": tax,
    "Zone": zone,
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
  };
}
