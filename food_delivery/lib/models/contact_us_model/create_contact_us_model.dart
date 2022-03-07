// To parse this JSON data, do
//
//     final createContactUsModel = createContactUsModelFromJson(jsonString);

import 'dart:convert';

CreateContactUsModel createContactUsModelFromJson(String str) => CreateContactUsModel.fromJson(json.decode(str));

String createContactUsModelToJson(CreateContactUsModel data) => json.encode(data.toJson());

class CreateContactUsModel {
  CreateContactUsModel({
    required this.status,
    required this.message,
    required this.contactUs,
  });

  bool status;
  String message;
  ContactUs contactUs;

  factory CreateContactUsModel.fromJson(Map<String, dynamic> json) => CreateContactUsModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    contactUs: ContactUs.fromJson(json["ContactUs"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "ContactUs": contactUs.toJson(),
  };
}

class ContactUs {
  ContactUs({
    required this.restaurant,
    required this.city,
    required this.fullName,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String restaurant;
  String city;
  String fullName;
  bool isActive;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
    restaurant: json["Restaurant"] ?? "",
    city: json["City"] ?? "",
    fullName: json["FullName"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Restaurant": restaurant,
    "City": city,
    "FullName": fullName,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
