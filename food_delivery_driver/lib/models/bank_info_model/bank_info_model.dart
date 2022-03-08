// To parse this JSON data, do
//
//     final bankInfoModel = bankInfoModelFromJson(jsonString);

import 'dart:convert';

BankInfoModel bankInfoModelFromJson(String str) => BankInfoModel.fromJson(json.decode(str));

String bankInfoModelToJson(BankInfoModel data) => json.encode(data.toJson());

class BankInfoModel {
  BankInfoModel({
    required this.status,
    required this.msg,
    required this.bankInfo,
  });

  bool status;
  String msg;
  BankInfo bankInfo;

  factory BankInfoModel.fromJson(Map<String, dynamic> json) => BankInfoModel(
    status: json["status"] ?? false,
    msg: json["msg"] ?? "",
    bankInfo: BankInfo.fromJson(json["BankInfo"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "BankInfo": bankInfo.toJson(),
  };
}

class BankInfo {
  BankInfo({
    required this.id,
    required this.bankName,
    required this.branchName,
    required this.holderName,
    required this.accountNo,
    required this.isActive,
    required this.restaurantId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String bankName;
  String branchName;
  String holderName;
  String accountNo;
  bool isActive;
  String restaurantId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory BankInfo.fromJson(Map<String, dynamic> json) => BankInfo(
    id: json["_id"] ?? "",
    bankName: json["BankName"] ?? "",
    branchName: json["BranchName"] ?? "",
    holderName: json["HolderName"] ?? "",
    accountNo: json["AccountNo"] ?? "",
    isActive: json["IsActive"] ?? false,
    restaurantId: json["RestaurantId"] ?? "",
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "BankName": bankName,
    "BranchName": branchName,
    "HolderName": holderName,
    "AccountNo": accountNo,
    "IsActive": isActive,
    "RestaurantId": restaurantId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
