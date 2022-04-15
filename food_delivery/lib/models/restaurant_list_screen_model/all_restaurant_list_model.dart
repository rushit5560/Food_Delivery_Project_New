// To parse this JSON data, do
//
//     final allRestaurantModel = allRestaurantModelFromJson(jsonString);

import 'dart:convert';

AllRestaurantModel allRestaurantModelFromJson(String str) => AllRestaurantModel.fromJson(json.decode(str));

String allRestaurantModelToJson(AllRestaurantModel data) => json.encode(data.toJson());

class AllRestaurantModel {
  AllRestaurantModel({
    required this.status,
    required this.message,
    required this.allStore,
  });

  bool status;
  String message;
  List<AllStore> allStore;

  factory AllRestaurantModel.fromJson(Map<String, dynamic> json) => AllRestaurantModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    allStore: List<AllStore>.from(json["allStore"].map((x) => AllStore.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "allStore": List<dynamic>.from(allStore.map((x) => x.toJson())),
  };
}

class AllStore {
  AllStore({
    required this.campaignjoin,
    required this.numberOfReviews,
    required this.rating,
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

  List<String> campaignjoin;
  int numberOfReviews;
  double rating;
  String id;
  String storeName;
  String address;
  String firstName;
  String lastName;
  String email;
  String password;
  double phone;
  String deliveryRange;
  String startTime;
  String endTime;
  String image;
  String coverImage;
  RoleId roleId;
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
  Zone zone;

  factory AllStore.fromJson(Map<String, dynamic> json) => AllStore(
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? {}),
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toDouble(),
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    address: json["Address"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"].toDouble() ?? 0.0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ?? "",
    coverImage: json["CoverImage"] ?? "",
    roleId: RoleId.fromJson(json["RoleId"] ?? {}),
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    tax: json["Tax"] ?? "",
    zone: Zone.fromJson(json["Zone"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
    "_id": id,
    "StoreName": storeName,
    "Address": address,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "Image": image,
    "CoverImage": coverImage,
    "RoleId": roleId.toJson(),
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
    "Zone": zone.toJson(),
  };
}


class RoleId {
  RoleId({
    required this.id,
    required this.roleName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.rolestatus,
  });

  String id;
  String roleName;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  int rolestatus;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
    id: json["_id"] ?? "",
    roleName: json["RoleName"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    rolestatus: json["Rolestatus"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "RoleName": roleName,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Rolestatus": rolestatus,
  };
}

class Zone {
  Zone({
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

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
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

