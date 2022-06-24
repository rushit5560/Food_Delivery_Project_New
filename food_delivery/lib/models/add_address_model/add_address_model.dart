// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
    required this.status,
    required this.message,
    required this.address,
  });

  bool status;
  String message;
  Address address;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    address: Address.fromJson(json["Address"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Address": address.toJson(),
  };
}

class Address {
  Address({
    required this.userId,
    required this.address1,
    required this.address2,
    required this.country,
    required this.state,
    required this.city,
    required this.landMark,
    required this.pincode,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String userId;
  String address1;
  String address2;
  String country;
  String state;
  String city;
  String landMark;
  int pincode;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    userId: json["UserId"] ?? "",
    address1: json["Address1"] ?? "",
    address2: json["Address2"] ?? "",
    country: json["Country"] ?? "",
    state: json["State"] ?? "",
    city: json["City"] ?? "",
    landMark: json["LandMark"] ?? "",
    pincode: json["Pincode"] ?? 0,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "Address1": address1,
    "Address2": address2,
    "Country": country,
    "State": state,
    "City": city,
    "LandMark": landMark,
    "Pincode": pincode,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
