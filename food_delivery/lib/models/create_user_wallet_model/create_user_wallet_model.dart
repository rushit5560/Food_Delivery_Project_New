// To parse this JSON data, do
//
//     final createUserWalletModel = createUserWalletModelFromJson(jsonString);

import 'dart:convert';

CreateUserWalletModel createUserWalletModelFromJson(String str) => CreateUserWalletModel.fromJson(json.decode(str));

String createUserWalletModelToJson(CreateUserWalletModel data) => json.encode(data.toJson());

class CreateUserWalletModel {
  CreateUserWalletModel({
    required this.status,
    required this.message,
    required this.wallet,
  });

  bool status;
  String message;
  Wallet wallet;

  factory CreateUserWalletModel.fromJson(Map<String, dynamic> json) => CreateUserWalletModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    wallet: Wallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
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
  });

  String id;
  String userId;
  int amount;
  DateTime rechargeDate;
  String status;
  String source;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"] ?? "",
    userId: json["UserId"] ?? "",
    amount: json["Amount"] ?? 0,
    rechargeDate: DateTime.parse(json["RechargeDate"] ?? DateTime.now()),
    status: json["Status"] ?? "",
    source: json["Source"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "UserId": userId,
    "Amount": amount,
    "RechargeDate": rechargeDate.toIso8601String(),
    "Status": status,
    "Source": source,
  };
}
