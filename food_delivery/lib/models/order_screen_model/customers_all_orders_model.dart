// To parse this JSON data, do
//
//     final customersAllOrdersModel = customersAllOrdersModelFromJson(jsonString);

import 'dart:convert';

CustomersAllOrdersModel customersAllOrdersModelFromJson(String str) => CustomersAllOrdersModel.fromJson(json.decode(str));

String customersAllOrdersModelToJson(CustomersAllOrdersModel data) => json.encode(data.toJson());

class CustomersAllOrdersModel {
  CustomersAllOrdersModel({
    required this.status,
    required this.order,
  });

  bool status;
  List<Order> order;

  factory CustomersAllOrdersModel.fromJson(Map<String, dynamic> json) => CustomersAllOrdersModel(
    status: json["status"] == null ? false : json["status"],
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
    required this.orderType,
  });

  String id;
  String orderNumber;
  DateTime orderDate;
  String storeId;
  UserId userId;
  String deliveryBy;
  String orderStatusId;
  int amount;
  String details;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String orderType;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"] == null ? "" : json["_id"],
    orderNumber: json["OrderNumber"] == null ? "" : json["OrderNumber"],
    orderDate: DateTime.parse(json["OrderDate"]),
    storeId: json["StoreId"] == null ? "" : json["StoreId"],
    userId: UserId.fromJson(json["UserId"]),
    deliveryBy: json["DeliveryBy"] == null ? "" : json["DeliveryBy"],
    orderStatusId: json["OrderStatusId"] == null ? "" : json["OrderStatusId"],
    amount: json["Amount"] == null ? 0 : json["Amount"],
    details: json["Details"] == null ? "" : json["Details"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
    orderType: json["OrderType"] == null ? "" : json["OrderType"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "OrderNumber": orderNumber,
    "OrderDate": orderDate.toIso8601String(),
    "StoreId": storeId,
    "UserId": userId.toJson(),
    "DeliveryBy": deliveryBy,
    "OrderStatusId": orderStatusId,
    "Amount": amount,
    "Details": details,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "OrderType": orderType,
  };
}

class UserId {
  UserId({
    required this.reseLink,
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

  String reseLink;
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
    reseLink: json["reseLink"] == null ? "" : json["reseLink"],
    id: json["_id"] == null ? "" : json["_id"],
    userName: json["UserName"] == null ? "" : json["UserName"],
    fullName: json["FullName"] == null ? "" : json["FullName"],
    phone: json["Phone"] == null ? "" : json["Phone"],
    email: json["Email"] == null ? "" : json["Email"],
    password: json["Password"] == null ? "" : json["Password"],
    address: json["Address"] == null ? "" : json["Address"],
    cityId: json["CityId"] == null ? "" : json["CityId"],
    areaId: json["AreaId"] == null ? "" : json["AreaId"],
    gender: json["Gender"] == null ? "" : json["Gender"],
    photo: json["Photo"] == null ? "" : json["Photo"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    roleId: json["RoleId"] == null ? "" : json["RoleId"],
    isVerified: json["IsVerified"] == null ? false : json["IsVerified"],
    createdBy: json["CreatedBy"] == null ? "" : json["CreatedBy"],
    updatedBy: json["UpdatedBy"] == null ? "" : json["UpdatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
    lastLogin: DateTime.parse(json["LastLogin"]),
  );

  Map<String, dynamic> toJson() => {
    "reseLink": reseLink,
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
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "LastLogin": lastLogin.toIso8601String(),
  };
}
