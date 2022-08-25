// To parse this JSON data, do
//
//     final joinCampaignScreenModel = joinCampaignScreenModelFromJson(jsonString);

import 'dart:convert';

JoinCampaignScreenModel joinCampaignScreenModelFromJson(String str) => JoinCampaignScreenModel.fromJson(json.decode(str));

String joinCampaignScreenModelToJson(JoinCampaignScreenModel data) => json.encode(data.toJson());

class JoinCampaignScreenModel {
  JoinCampaignScreenModel({
    required this.status,
    required this.message,
    required this.campaign,
  });

  bool status;
  String message;
  Campaign campaign;

  factory JoinCampaignScreenModel.fromJson(Map<String, dynamic> json) => JoinCampaignScreenModel(
    status: json["status"]?? false,
    message: json["message"] ?? "",
    campaign: Campaign.fromJson(json["campaign"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "campaign": campaign.toJson(),
  };
}

class Campaign {
  Campaign({
    required this.restaurant,
    required this.campaignId,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String restaurant;
  String campaignId;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
    restaurant: json["Restaurant"] ?? "",
    campaignId: json["CampaignID"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Restaurant": restaurant,
    "CampaignID": campaignId,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
