import 'dart:convert';

BasicCampaignModel basicCampaignModelFromJson(String str) => BasicCampaignModel.fromJson(json.decode(str));

String basicCampaignModelToJson(BasicCampaignModel data) => json.encode(data.toJson());

class BasicCampaignModel {
  BasicCampaignModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<BasicCampaignListElement> list;

  factory BasicCampaignModel.fromJson(Map<String, dynamic> json) => BasicCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<BasicCampaignListElement>.from(json["List"].map((x) => BasicCampaignListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class BasicCampaignListElement {
  BasicCampaignListElement({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.dailyStartTime,
    required this.dailyEndTime,
    required this.description,
    required this.campaignImage,
    required this.restaurant,
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
  List<Restaurant> restaurant;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory BasicCampaignListElement.fromJson(Map<String, dynamic> json) => BasicCampaignListElement(
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    startDate: json["StartDate"] ?? "",
    endDate: json["EndDate"] ?? "",
    dailyStartTime: json["DailyStartTime"] ?? "",
    dailyEndTime: json["DailyEndTime"] ?? "",
    description: json["Description"] ?? "",
    campaignImage: json["CampaignImage"] ?? "",
    restaurant: List<Restaurant>.from(json["Restaurant"].map((x) => Restaurant.fromJson(x)) ?? {}),
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
    "Restaurant": List<dynamic>.from(restaurant.map((x) => x.toJson())),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Restaurant {
  Restaurant({
    required this.value,
    required this.id,
  });

  String value;
  String id;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      Restaurant(
        value: json["value"] ?? "",
        id: json["_id"] ?? "",
      );

  Map<String, dynamic> toJson() =>
      {
        "value": value,
        "_id": id,
      };
}