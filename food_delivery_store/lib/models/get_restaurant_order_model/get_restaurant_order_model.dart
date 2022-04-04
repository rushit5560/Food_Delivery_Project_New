// To parse this JSON data, do
//
//     final getRestaurantOrderModel = getRestaurantOrderModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantOrderModel getRestaurantOrderModelFromJson(String str) => GetRestaurantOrderModel.fromJson(json.decode(str));

String getRestaurantOrderModelToJson(GetRestaurantOrderModel data) => json.encode(data.toJson());

class GetRestaurantOrderModel {
  GetRestaurantOrderModel({
    required this.status,
    required this.order,
  });

  bool status;
  List<Order> order;

  factory GetRestaurantOrderModel.fromJson(Map<String, dynamic> json) => GetRestaurantOrderModel(
    status: json["status"] ?? false,
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
  };
}

class Order {
  Order({
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
  DeliveryBy deliveryBy;
  OrderStatusId orderStatusId;
  int amount;
  String details;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"] ?? "",
    orderNumber: json["OrderNumber"] ?? "",
    orderDate: DateTime.parse(json["OrderDate"] ?? DateTime.now()),
    storeId: StoreId.fromJson(json["StoreId"] ?? {}),
    userId: UserId.fromJson(json["UserId"] ?? {}),
    deliveryBy: DeliveryBy.fromJson(json["DeliveryBy"] ?? {}),
    orderStatusId: OrderStatusId.fromJson(json["OrderStatusId"] ?? {}),
    amount: json["Amount"] ?? 0,
    details: json["Details"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "OrderNumber": orderNumber,
    "OrderDate": orderDate.toIso8601String(),
    "StoreId": storeId.toJson(),
    "UserId": userId.toJson(),
    "DeliveryBy": deliveryBy.toJson(),
    "OrderStatusId": orderStatusId.toJson(),
    "Amount": amount,
    "Details": details,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class DeliveryBy {
  DeliveryBy({
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
    required this.isActive,
    required this.email,
    required this.image,
    required this.isVerified,
    required this.v,
    required this.identityImage,
    required this.deliveryManType,
  });

  String id;
  String firstName;
  String lastName;
  int phone;
  String password;
  String gender;
  String zone;
  String roleId;
  String restaurant;
  String address;
  String identityType;
  String identityNumber;
  bool isActive;
  String email;
  String image;
  bool isVerified;
  int v;
  String identityImage;
  String deliveryManType;

  factory DeliveryBy.fromJson(Map<String, dynamic> json) => DeliveryBy(
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    phone: json["Phone"] ?? 0,
    password: json["Password"] ?? "",
    gender: json["Gender"] ?? "",
    zone: json["Zone"] ?? "",
    roleId: json["RoleId"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    address: json["Address"] ?? "",
    identityType: json["IdentityType"] ?? "",
    identityNumber: json["IdentityNumber"] ?? "",
    isActive: json["IsActive"] ?? false,
    email: json["Email"] ?? "",
    image: json["Image"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    v: json["__v"] ?? 0,
    identityImage: json["IdentityImage"] ?? "",
    deliveryManType: json["DeliveryManType"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "Zone": zone,
    "RoleId": roleId,
    "Restaurant": restaurant,
    "Address": address,
    "IdentityType": identityType,
    "IdentityNumber": identityNumber,
    "IsActive": isActive,
    "Email": email,
    "Image": image,
    "IsVerified": isVerified,
    "__v": v,
    "IdentityImage": identityImage,
    "DeliveryManType": deliveryManType,
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
  String createdAt;
  String updatedAt;
  int v;

  factory OrderStatusId.fromJson(Map<String, dynamic> json) => OrderStatusId(
    id: json["_id"] ?? "",
    status: json["Status"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Status": status,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class StoreId {
  StoreId({
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
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
    id: json["_id"],
    storeName: json["StoreName"],
    address: json["Address"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    password: json["Password"],
    phone: json["Phone"],
    deliveryRange: json["DeliveryRange"],
    startTime: DateTime.parse(json["StartTime"] ?? DateTime.now()),
    endTime: DateTime.parse(json["EndTime"] ?? DateTime.now()),
    image: json["Image"],
    coverImage: json["CoverImage"],
    roleId: json["RoleId"],
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"],
    updatedBy: json["UpdatedBy"],
    approvedOn: DateTime.parse(json["ApprovedOn"] ?? DateTime.now()),
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"],
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
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
  DateTime createdAt;
  DateTime updatedAt;
  int v;

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
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
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
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
