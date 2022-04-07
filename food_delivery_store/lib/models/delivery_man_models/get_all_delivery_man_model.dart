// To parse this JSON data, do
//
//     final getAllDeliveryManModel = getAllDeliveryManModelFromJson(jsonString);

import 'dart:convert';

GetAllDeliveryManModel getAllDeliveryManModelFromJson(String str) => GetAllDeliveryManModel.fromJson(json.decode(str));

String getAllDeliveryManModelToJson(GetAllDeliveryManModel data) => json.encode(data.toJson());

class GetAllDeliveryManModel {
  GetAllDeliveryManModel({
    required this.status,
    required this.getList,
  });

  bool status;
  List<GetList> getList;

  factory GetAllDeliveryManModel.fromJson(Map<String, dynamic> json) => GetAllDeliveryManModel(
    status: json["status"] ?? false,
    getList: List<GetList>.from(json["getList"].map((x) => GetList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetList {
  GetList({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.gender,
    required this.roleId,
    required this.restaurant,
    required this.address,
    required this.identityType,
    required this.identityNumber,
    required this.isActive,
    required this.email,
    required this.identityImage,
    required this.image,
    required this.isVerified,
    required this.v,
  });

  String id;
  String firstName;
  String lastName;
  int phone;
  String password;
  String gender;
  String roleId;
  String restaurant;
  String address;
  String identityType;
  String identityNumber;
  bool isActive;
  String email;
  String identityImage;
  String image;
  bool isVerified;
  int v;

  factory GetList.fromJson(Map<String, dynamic> json) => GetList(
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    phone: json["Phone"] ?? 0,
    password: json["Password"] ?? "",
    gender: json["Gender"] ?? "",
    roleId: json["RoleId"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    address: json["Address"] ?? "",
    identityType: json["IdentityType"] ?? "",
    identityNumber: json["IdentityNumber"] ?? "",
    isActive: json["IsActive"] ?? false,
    email: json["Email"] ?? "",
    identityImage: json["IdentityImage"] ?? "",
    image: json["Image"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "RoleId": roleId,
    "Restaurant": restaurant,
    "Address": address,
    "IdentityType": identityType,
    "IdentityNumber": identityNumber,
    "IsActive": isActive,
    "Email": email,
    "IdentityImage": identityImage,
    "Image": image,
    "IsVerified": isVerified,
    "__v": v,
  };
}
