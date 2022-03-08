// To parse this JSON data, do
//
//     final createDriverWalletModel = createDriverWalletModelFromJson(jsonString);

import 'dart:convert';

CreateDriverWalletModel createDriverWalletModelFromJson(String str) => CreateDriverWalletModel.fromJson(json.decode(str));

String createDriverWalletModelToJson(CreateDriverWalletModel data) => json.encode(data.toJson());

class CreateDriverWalletModel {
  CreateDriverWalletModel({
    required this.message,
    required this.wallet,
  });

  String message;
  Wallet wallet;

  factory CreateDriverWalletModel.fromJson(Map<String, dynamic> json) => CreateDriverWalletModel(
    message: json["message"] ?? "",
    wallet: Wallet.fromJson(json["wallet"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "wallet": wallet.toJson(),
  };
}

class Wallet {
  Wallet({
    required this.id,
    required this.deliveryPersonId,
    required this.amount,
    required this.rechargeDate,
    required this.status,
    required this.source,
  });

  String id;
  String deliveryPersonId;
  int amount;
  DateTime rechargeDate;
  String status;
  String source;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"] ?? "",
    deliveryPersonId: json["DeliveryPersonId"] ?? "",
    amount: json["Amount"] ?? 0,
    rechargeDate: DateTime.parse(json["RechargeDate"] ?? {}),
    status: json["Status"] ?? "",
    source: json["Source"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "DeliveryPersonId": deliveryPersonId,
    "Amount": amount,
    "RechargeDate": rechargeDate.toIso8601String(),
    "Status": status,
    "Source": source,
  };
}
