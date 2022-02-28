// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.status,
    required this.message,
    required this.role,
    required this.token,
  });

  bool status;
  String message;
  String role;
  String token;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "" : json["message"],
    role: json["Role"] == null ? "" : json["Role"],
    token: json["Token"] == null ? "" : json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status.toString().isEmpty ? false : status,
    "message": message.isEmpty ? "" : message,
    "Role": role.isEmpty ? "" : role,
    "Token": token.isEmpty ? "" : token,
  };
}
