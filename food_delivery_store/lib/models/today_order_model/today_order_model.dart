// To parse this JSON data, do
//
//     final getTodayOrderModel = getTodayOrderModelFromJson(jsonString);

import 'dart:convert';

GetTodayOrderModel getTodayOrderModelFromJson(String str) => GetTodayOrderModel.fromJson(json.decode(str));

String getTodayOrderModelToJson(GetTodayOrderModel data) => json.encode(data.toJson());

class GetTodayOrderModel {
  GetTodayOrderModel({
    required this.status,
    required this.order,
  });

  bool status;
  List<Order> order;

  factory GetTodayOrderModel.fromJson(Map<String, dynamic> json) => GetTodayOrderModel(
    status: json["status"],
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
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
  String userId;
  String deliveryBy;
  String orderStatusId;
  int amount;
  String details;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"],
    orderNumber: json["OrderNumber"],
    orderDate: DateTime.parse(json["OrderDate"]),
    storeId: StoreId.fromJson(json["StoreId"]),
    userId: json["UserId"],
    deliveryBy: json["DeliveryBy"],
    orderStatusId: json["OrderStatusId"],
    amount: json["Amount"],
    details: json["Details"],
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "OrderNumber": orderNumber,
    "OrderDate": orderDate.toIso8601String(),
    "StoreId": storeId.toJson(),
    "UserId": userId,
    "DeliveryBy": deliveryBy,
    "OrderStatusId": orderStatusId,
    "Amount": amount,
    "Details": details,
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
    id: json["_id"],
    storeName: json["StoreName"],
    tax: json["Tax"],
    address: json["Address"],
    minDeliveryTime: json["MinDeliveryTime"],
    maxDeliveryTime: json["MaxDeliveryTime"],
    zone: json["Zone"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    password: json["Password"],
    phone: json["Phone"],
    deliveryRange: json["DeliveryRange"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    roleId: json["RoleId"],
    isActive: json["IsActive"],
    isApproved: json["IsApproved"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
