// To parse this JSON data, do
//
//     final getAllRestaurantsModel = getAllRestaurantsModelFromJson(jsonString);

import 'dart:convert';

GetAllRestaurantsModel getAllRestaurantsModelFromJson(String str) => GetAllRestaurantsModel.fromJson(json.decode(str));

String getAllRestaurantsModelToJson(GetAllRestaurantsModel data) => json.encode(data.toJson());

class GetAllRestaurantsModel {
  GetAllRestaurantsModel({
    required this.status,
    required this.message,
    required this.allStore,
  });

  bool status;
  String message;
  List<AllStore> allStore;

  factory GetAllRestaurantsModel.fromJson(Map<String, dynamic> json) => GetAllRestaurantsModel(
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
    this.id,
    this.storeName,
    this.tax,
    this.address,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.zone,
    this.latitude,
    this.longitude,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.deliveryRange,
    this.startTime,
    this.endTime,
    this.image,
    this.roleId,
    this.isActive,
    this.isApproved,
    this.createdBy,
    this.updatedBy,
    this.approvedOn,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.coverImage,
  });

  String? id;
  String? storeName;
  String? tax;
  String? address;
  String? minDeliveryTime;
  String? maxDeliveryTime;
  Zone? zone;
  String? latitude;
  String? longitude;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? phone;
  String? deliveryRange;
  String? startTime;
  String? endTime;
  String? image;
  RoleId? roleId;
  bool? isActive;
  bool? isApproved;
  String? createdBy;
  String? updatedBy;
  String? approvedOn;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? coverImage;

  factory AllStore.fromJson(Map<String, dynamic> json) => AllStore(
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    tax: json["Tax"] ?? "",
    address: json["Address"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    zone: Zone.fromJson(json["Zone"] ?? {}),
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ?? "",
    roleId: RoleId.fromJson(json["RoleId"] ?? {}),
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    coverImage: json["CoverImage"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Tax": tax,
    "Address": address,
    "MinDeliveryTime": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime,
    "Zone": zone!.toJson(),
    "Latitude": latitude,
    "Longitude": longitude,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "Image": image,
    "RoleId": roleId!.toJson(),
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "CoverImage": coverImage,
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

