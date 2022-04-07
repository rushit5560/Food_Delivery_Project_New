// To parse this JSON data, do
//
//     final updateRestaurantBankInfoModel = updateRestaurantBankInfoModelFromJson(jsonString);

import 'dart:convert';

UpdateRestaurantBankInfoModel updateRestaurantBankInfoModelFromJson(String str) => UpdateRestaurantBankInfoModel.fromJson(json.decode(str));

String updateRestaurantBankInfoModelToJson(UpdateRestaurantBankInfoModel data) => json.encode(data.toJson());

class UpdateRestaurantBankInfoModel {
  UpdateRestaurantBankInfoModel({
    required this.status,
    required this.msg,
    required this.bankInfo,
  });

  bool status;
  String msg;
  BankInfo bankInfo;

  factory UpdateRestaurantBankInfoModel.fromJson(Map<String, dynamic> json) => UpdateRestaurantBankInfoModel(
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
  String createdAt;
  String updatedAt;
  int v;

  factory BankInfo.fromJson(Map<String, dynamic> json) => BankInfo(
    id: json["_id"] ?? "",
    bankName: json["BankName"] ?? "",
    branchName: json["BranchName"] ?? "",
    holderName: json["HolderName"] ?? "",
    accountNo: json["AccountNo"] ?? "",
    isActive: json["IsActive"] ?? false,
    restaurantId: json["RestaurantId"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
