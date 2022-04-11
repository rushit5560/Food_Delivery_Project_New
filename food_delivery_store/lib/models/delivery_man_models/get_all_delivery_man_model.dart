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
  List<DeliveryManGetList> getList;

  factory GetAllDeliveryManModel.fromJson(Map<String, dynamic> json) => GetAllDeliveryManModel(
    status: json["status"] ?? false,
    getList: List<DeliveryManGetList>.from(json["getList"].map((x) => DeliveryManGetList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class DeliveryManGetList {
  DeliveryManGetList({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.gender,
    required this.zone,
    required this.roleId,
    required this.restaurant,
    required this.address,
    required this.identityType,
    required this.identityNumber,
    required this.isSuspended,
    required this.isActive,
    required this.email,
    required this.identityImage,
    required this.image,
    required this.isVerified,
    required this.v,
    required this.deliveryManType,
  });

  String id;
  String firstName;
  String lastName;
  int phone;
  String password;
  String gender;
  ZoneClass zone;
  String roleId;
  Restaurant restaurant;
  String address;
  String identityType;
  String identityNumber;
  bool isSuspended;
  bool isActive;
  String email;
  String identityImage;
  String image;
  bool isVerified;
  int v;
  String deliveryManType;

  factory DeliveryManGetList.fromJson(Map<String, dynamic> json) => DeliveryManGetList(
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    phone: json["Phone"] ?? 0,
    password: json["Password"] ?? "",
    gender: json["Gender"] ?? "",
    zone: ZoneClass.fromJson(json["Zone"] ?? {}),
    roleId: json["RoleId"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    address: json["Address"] ?? "",
    identityType: json["IdentityType"] ?? "",
    identityNumber: json["IdentityNumber"] ?? "",
    isSuspended: json["IsSuspended"] ?? "",
    isActive: json["IsActive"] ?? "",
    email: json["Email"] ?? "",
    identityImage: json["IdentityImage"] ?? "",
    image: json["Image"] ?? "",
    isVerified: json["IsVerified"] ?? "",
    v: json["__v"] ?? 0,
    deliveryManType: json["DeliveryManType"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "Zone": zone.toJson(),
    "RoleId": roleId,
    "Restaurant": restaurant.toJson(),
    "Address": address,
    "IdentityType": identityType,
    "IdentityNumber": identityNumber,
    "IsSuspended": isSuspended,
    "IsActive": isActive,
    "Email": email,
    "IdentityImage": identityImage,
    "Image": image,
    "IsVerified": isVerified,
    "__v": v,
    "DeliveryManType": deliveryManType,
  };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.storeName,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.image,
    required this.coverImage,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.latitude,
    required this.longitude,
    required this.maxDeliveryTime,
    required this.minDeliveryTime,
    required this.tax,
    required this.zone,
  });

  String id;
  String storeName;
  String address;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  DateTime startTime;
  DateTime endTime;
  String image;
  String coverImage;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  String approvedOn;
  String createdAt;
  String updatedAt;
  int v;
  String latitude;
  String longitude;
  String maxDeliveryTime;
  String minDeliveryTime;
  String tax;
  String zone;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"],
    storeName: json["StoreName"],
    address: json["Address"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    password: json["Password"],
    phone: json["Phone"],
    deliveryRange: json["DeliveryRange"],
    startTime: DateTime.parse(json["StartTime"]),
    endTime: DateTime.parse(json["EndTime"]),
    image: json["Image"],
    coverImage: json["CoverImage"],
    roleId: json["RoleId"],
    isActive: json["IsActive"],
    isApproved: json["IsApproved"],
    createdBy: json["CreatedBy"],
    updatedBy: json["UpdatedBy"],
    approvedOn: json["ApprovedOn"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    maxDeliveryTime: json["MaxDeliveryTime"],
    minDeliveryTime: json["MinDeliveryTime"],
    tax: json["Tax"],
    zone: json["Zone"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Address": address,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime.toIso8601String(),
    "EndTime": endTime.toIso8601String(),
    "Image": image,
    "CoverImage": coverImage,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Latitude": latitude,
    "Longitude": longitude,
    "MaxDeliveryTime": maxDeliveryTime,
    "MinDeliveryTime": minDeliveryTime,
    "Tax": tax,
    "Zone": zone,
  };
}



class ZoneClass {
  ZoneClass({
    required this.id,
    required this.name,
    required this.coordinates,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String coordinates;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ZoneClass.fromJson(Map<String, dynamic> json) => ZoneClass(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    coordinates: json["Coordinates"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Coordinates": coordinates,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}


