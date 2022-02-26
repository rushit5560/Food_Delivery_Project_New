// To parse this JSON data, do
//
//     final registrationUserModel = registrationUserModelFromJson(jsonString);

import 'dart:convert';

RegistrationUserModel registrationUserModelFromJson(String str) => RegistrationUserModel.fromJson(json.decode(str));

String registrationUserModelToJson(RegistrationUserModel data) => json.encode(data.toJson());

class RegistrationUserModel {
  RegistrationUserModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory RegistrationUserModel.fromJson(Map<String, dynamic> json) => RegistrationUserModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "Something went wrong!" : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status ,
    "message": message.isEmpty ? "" : message,
  };
}
