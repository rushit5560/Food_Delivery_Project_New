// To parse this JSON data, do
//
//     final joinedCampaignModel = joinedCampaignModelFromJson(jsonString);

import 'dart:convert';

JoinedCampaignModel joinedCampaignModelFromJson(String str) => JoinedCampaignModel.fromJson(json.decode(str));

String joinedCampaignModelToJson(JoinedCampaignModel data) => json.encode(data.toJson());

class JoinedCampaignModel {
  JoinedCampaignModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<JoinedCampaignElement> list;

  factory JoinedCampaignModel.fromJson(Map<String, dynamic> json) => JoinedCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<JoinedCampaignElement>.from(json["List"].map((x) => JoinedCampaignElement.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class JoinedCampaignElement {
  JoinedCampaignElement({
    required this.id,
    required this.restaurant,
    required this.campaignId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String restaurant;
  CampaignId campaignId;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory JoinedCampaignElement.fromJson(Map<String, dynamic> json) => JoinedCampaignElement(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    campaignId: CampaignId.fromJson(json["CampaignID"] ?? {}),
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant,
    "CampaignID": campaignId.toJson(),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class CampaignId {
  CampaignId({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.dailyStartTime,
    required this.dailyEndTime,
    required this.description,
    required this.campaignImage,
    // required this.restaurant,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String startDate;
  String endDate;
  String dailyStartTime;
  String dailyEndTime;
  String description;
  String campaignImage;
  // List<Restaurant> restaurant;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory CampaignId.fromJson(Map<String, dynamic> json) => CampaignId(
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    startDate: json["StartDate"] ?? "",
    endDate: json["EndDate"] ?? "",
    dailyStartTime: json["DailyStartTime"] ?? "",
    dailyEndTime: json["DailyEndTime"] ?? "",
    description: json["Description"] ?? "",
    campaignImage: json["CampaignImage"] ?? "",
    // restaurant: List<Restaurant>.from(json["Restaurant"].map((x) => Restaurant.fromJson(x))),
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "StartDate": startDate,
    "EndDate": endDate,
    "DailyStartTime": dailyStartTime,
    "DailyEndTime": dailyEndTime,
    "Description": description,
    "CampaignImage": campaignImage,
    // "Restaurant": List<dynamic>.from(restaurant.map((x) => x.toJson())),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

// class Restaurant {
//   Restaurant({
//     this.value,
//     this.id,
//   });
//
//   String value;
//   String id;
//
//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//     value: json["value"],
//     id: json["_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "value": value,
//     "_id": id,
//   };
// }
