// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.status,
    required this.message,
    required this.getList,
  });

  bool status;
  String message;
  List<GetList> getList;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "" : json["message"],
    getList: List<GetList>.from(json["getList"].map((x) => GetList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetList {
  GetList({
    required this.id,
    required this.title,
    required this.bannerImage,
    required this.isCommon,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.category,
  });

  String id;
  String title;
  String bannerImage;
  bool isCommon;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String category;

  factory GetList.fromJson(Map<String, dynamic> json) => GetList(
    id: json["_id"] == null ? "" :  json["_id"],
    title: json["Title"] == null ? "" : json["Title"],
    bannerImage: json["BannerImage"] == null ? "" : json["BannerImage"],
    isCommon: json["IsCommon"] == null ? false : json["IsCommon"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
    category: json["Category"] == null ? "" : json["Category"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "BannerImage": bannerImage,
    "IsCommon": isCommon,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Category": category == null ? null : category,
  };
}