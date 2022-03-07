// To parse this JSON data, do
//
//     final signUpAdminModel = signUpAdminModelFromJson(jsonString);

import 'dart:convert';

SignUpAdminModel signUpAdminModelFromJson(String str) => SignUpAdminModel.fromJson(json.decode(str));

String signUpAdminModelToJson(SignUpAdminModel data) => json.encode(data.toJson());

class SignUpAdminModel {
  SignUpAdminModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory SignUpAdminModel.fromJson(Map<String, dynamic> json) => SignUpAdminModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "Something went wrong!" : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message.isEmpty ? "" : message,
  };
}