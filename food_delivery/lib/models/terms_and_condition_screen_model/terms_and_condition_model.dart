// To parse this JSON data, do
//
//     final termsAndConditionModel = termsAndConditionModelFromJson(jsonString);

import 'dart:convert';

TermsAndConditionModel termsAndConditionModelFromJson(String str) => TermsAndConditionModel.fromJson(json.decode(str));

String termsAndConditionModelToJson(TermsAndConditionModel data) => json.encode(data.toJson());

class TermsAndConditionModel {
  TermsAndConditionModel({
    required this.status,
    required this.pageSetup,
  });

  bool status;
  PageSetup pageSetup;

  factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) => TermsAndConditionModel(
    status: json["status"] ?? false,
    pageSetup: PageSetup.fromJson(json["PageSetup"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "PageSetup": pageSetup.toJson(),
  };
}

class PageSetup {
  PageSetup({
    required this.id,
    required this.termsAndCondition,
    required this.aboutUs,
    required this.privacy,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.createdBy,
  });

  String id;
  String termsAndCondition;
  String aboutUs;
  String privacy;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String createdBy;

  factory PageSetup.fromJson(Map<String, dynamic> json) => PageSetup(
    id: json["_id"] ?? "",
    termsAndCondition: json["TermsAndCondition"] ?? "",
    aboutUs: json["AboutUs"] ?? "",
    privacy: json["Privacy"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    createdBy: json["CreatedBy"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "TermsAndCondition": termsAndCondition,
    "AboutUs": aboutUs,
    "Privacy": privacy,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "CreatedBy": createdBy,
  };
}
