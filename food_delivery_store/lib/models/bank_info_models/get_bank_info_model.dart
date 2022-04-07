// To parse this JSON data, do
//
//     final getRestaurantBankInfoModel = getRestaurantBankInfoModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantBankInfoModel getRestaurantBankInfoModelFromJson(String str) => GetRestaurantBankInfoModel.fromJson(json.decode(str));

String getRestaurantBankInfoModelToJson(GetRestaurantBankInfoModel data) => json.encode(data.toJson());

class GetRestaurantBankInfoModel {
  GetRestaurantBankInfoModel({
    required this.status,
    required this.bankInfo,
  });

  bool status;
  BankInfo bankInfo;

  factory GetRestaurantBankInfoModel.fromJson(Map<String, dynamic> json) => GetRestaurantBankInfoModel(
    status: json["status"] ?? false,
    bankInfo: BankInfo.fromJson(json["BankInfo"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
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
