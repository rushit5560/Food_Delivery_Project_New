// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "" : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status.toString().isEmpty ? false : status,
    "message": message.isEmpty ? "" : message,
  };
}
