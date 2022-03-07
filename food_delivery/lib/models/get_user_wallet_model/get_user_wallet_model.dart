// To parse this JSON data, do
//
//     final getUserWalletModel = getUserWalletModelFromJson(jsonString);

import 'dart:convert';

GetUserWalletModel getUserWalletModelFromJson(String str) => GetUserWalletModel.fromJson(json.decode(str));

String getUserWalletModelToJson(GetUserWalletModel data) => json.encode(data.toJson());

class GetUserWalletModel {
  GetUserWalletModel({
    required this.status,
    required this.wallet,
  });

  bool status;
  Wallet wallet;

  factory GetUserWalletModel.fromJson(Map<String, dynamic> json) => GetUserWalletModel(
    status: json["status"] ?? false,
    wallet: Wallet.fromJson(json["wallet"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "wallet": wallet.toJson(),
  };
}

class Wallet {
  Wallet({
    required this.id,
    required this.userId,
    required this.amount,
    required this.rechargeDate,
    required this.status,
    required this.source,
    required this.v,
  });

  String id;
  String userId;
  int amount;
  DateTime rechargeDate;
  String status;
  String source;
  int v;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["_id"] ?? "",
    userId: json["UserId"] ?? "",
    amount: json["Amount"] ?? 0,
    rechargeDate: DateTime.parse(json["RechargeDate"] ?? DateTime.now()),
    status: json["Status"] ?? "",
    source: json["Source"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserId": userId,
    "Amount": amount,
    "RechargeDate": rechargeDate.toIso8601String(),
    "Status": status,
    "Source": source,
    "__v": v,
  };
}
