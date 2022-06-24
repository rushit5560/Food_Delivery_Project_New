// To parse this JSON data, do
//
//     final getAllAddressModel = getAllAddressModelFromJson(jsonString);

import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) => GetAllAddressModel.fromJson(json.decode(str));

String getAllAddressModelToJson(GetAllAddressModel data) => json.encode(data.toJson());

class GetAllAddressModel {
  GetAllAddressModel({
    required this.status,
    required this.addressList,
  });

  bool status;
  List<AddressList> addressList;

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) => GetAllAddressModel(
    status: json["status"] ?? false,
    addressList: List<AddressList>.from(json["AddressList"].map((x) => AddressList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "AddressList": List<dynamic>.from(addressList.map((x) => x.toJson())),
  };
}

class AddressList {
  AddressList({
    required this.id,
    required this.userId,
    required this.address1,
    required this.address2,
    required this.country,
    required this.state,
    required this.city,
    required this.landMark,
    required this.pincode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  String address1;
  String address2;
  String country;
  String state;
  String city;
  String landMark;
  int pincode;
  String createdAt;
  String updatedAt;
  int v;

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
    id: json["_id"] ?? "",
    userId: json["UserId"] ?? "",
    address1: json["Address1"] ?? "",
    address2: json["Address2"] ?? "",
    country: json["Country"]  ?? "",
    state: json["State"] ?? "",
    city: json["City"] ?? "",
    landMark: json["LandMark"] ?? "",
    pincode: json["Pincode"] ?? 0,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__"] ?? 0
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserId": userId,
    "Address1": address1,
    "Address2": address2,
    "Country": country == null ? null : country,
    "State": state == null ? null : state,
    "City": city == null ? null : city,
    "LandMark": landMark == null ? null : landMark,
    "Pincode": pincode == null ? null : pincode,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
