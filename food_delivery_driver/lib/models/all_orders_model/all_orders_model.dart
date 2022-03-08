// To parse this JSON data, do
//
//     final allOrdersModel = allOrdersModelFromJson(jsonString);

import 'dart:convert';

AllOrdersModel allOrdersModelFromJson(String str) => AllOrdersModel.fromJson(json.decode(str));

String allOrdersModelToJson(AllOrdersModel data) => json.encode(data.toJson());

class AllOrdersModel {
  AllOrdersModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElement> list;

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) => AllOrdersModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.storeId,
    required this.userId,
    required this.deliveryBy,
    required this.orderStatusId,
    required this.amount,
    required this.details,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String orderNumber;
  DateTime orderDate;
  StoreId storeId;
  UserId userId;
  String deliveryBy;
  OrderStatusId orderStatusId;
  int amount;
  String details;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["_id"] ?? "",
    orderNumber: json["OrderNumber"] ?? "",
    orderDate: DateTime.parse(json["OrderDate"] ?? DateTime.now()),
    storeId: StoreId.fromJson(json["StoreId"] ?? {}),
    userId: UserId.fromJson(json["UserId"] ?? {}),
    deliveryBy: json["DeliveryBy"] ?? "",
    orderStatusId: OrderStatusId.fromJson(json["OrderStatusId"] ?? {}),
    amount: json["Amount"] ?? 0,
    details: json["Details"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "OrderNumber": orderNumber,
    "OrderDate": orderDate.toIso8601String(),
    "StoreId": storeId.toJson(),
    "UserId": userId.toJson(),
    "DeliveryBy": deliveryBy,
    "OrderStatusId": orderStatusId.toJson(),
    "Amount": amount,
    "Details": details,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class OrderStatusId {
  OrderStatusId({
    required this.id,
    required this.status,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String status;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory OrderStatusId.fromJson(Map<String, dynamic> json) => OrderStatusId(
    id: json["_id"] ?? "",
    status: json["Status"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Status": status,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class StoreId {
  StoreId({
    required this.id,
    required this.storeName,
    required this.tax,
    required this.address,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.zone,
    required this.latitude,
    required this.longitude,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String storeName;
  String tax;
  String address;
  String minDeliveryTime;
  String maxDeliveryTime;
  String zone;
  String latitude;
  String longitude;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  String startTime;
  String endTime;
  String roleId;
  bool isActive;
  bool isApproved;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    tax: json["Tax"] ?? "",
    address: json["Address"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    zone: json["Zone"] ?? "",
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
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    approvedOn: DateTime.parse(json["ApprovedOn"] ?? DateTime.now()),
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Tax": tax,
    "Address": address,
    "MinDeliveryTime": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime,
    "Zone": zone,
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
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  UserId({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
    required this.cityId,
    required this.areaId,
    required this.gender,
    required this.photo,
    required this.isActive,
    required this.roleId,
    required this.isVerified,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastLogin,
  });

  String id;
  String userName;
  String fullName;
  String phone;
  String email;
  String password;
  String address;
  String cityId;
  String areaId;
  String gender;
  String photo;
  bool isActive;
  String roleId;
  bool isVerified;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DateTime lastLogin;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"] ?? "",
    userName: json["UserName"] ?? "",
    fullName: json["FullName"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    address: json["Address"] ?? "",
    cityId: json["CityId"] ?? "",
    areaId: json["AreaId"] ?? "",
    gender: json["Gender"] ?? "",
    photo: json["Photo"] ?? "",
    isActive: json["IsActive"] ?? false,
    roleId: json["RoleId"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    lastLogin: DateTime.parse(json["LastLogin"] ?? DateTime.now()),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserName": userName,
    "FullName": fullName,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Address": address,
    "CityId": cityId,
    "AreaId": areaId,
    "Gender": gender,
    "Photo": photo,
    "IsActive": isActive,
    "RoleId": roleId,
    "IsVerified": isVerified,
    "CreatedBy": createdBy.isEmpty ? null : createdBy,
    "UpdatedBy": updatedBy.isEmpty ? null : updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "LastLogin": lastLogin.toIso8601String(),
  };
}
