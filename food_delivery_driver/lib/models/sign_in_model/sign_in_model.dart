// To parse this JSON data, do
//
//     final userSignInModel = userSignInModelFromJson(jsonString);

import 'dart:convert';

UserSignInModel userSignInModelFromJson(String str) => UserSignInModel.fromJson(json.decode(str));

String userSignInModelToJson(UserSignInModel data) => json.encode(data.toJson());

class UserSignInModel {
  UserSignInModel({
    required this.status,
    required this.message,
    required this.role,
    required this.token,
  });

  bool status;
  String message;
  String role;
  String token;

  factory UserSignInModel.fromJson(Map<String, dynamic> json) => UserSignInModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    role: json["Role"] ?? "",
    token: json["Token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Role": role,
    "Token": token,
  };
}
