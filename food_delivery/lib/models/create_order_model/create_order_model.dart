// To parse this JSON data, do
//
//     final createOrderModel = createOrderModelFromJson(jsonString);

import 'dart:convert';

CreateOrderModel createOrderModelFromJson(String str) => CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) => json.encode(data.toJson());

class CreateOrderModel {
  CreateOrderModel({
    required this.status,
    required this.message,
    required this.order,
    required this.orderitem,
  });

  bool status;
  String message;
  Order order;
  List<Orderitem> orderitem;

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) => CreateOrderModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    order: Order.fromJson(json["order"] ?? {}),
    orderitem: List<Orderitem>.from(json["orderitem"].map((x) => Orderitem.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "order": order.toJson(),
    "orderitem": List<dynamic>.from(orderitem.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    required this.userId,
    required this.restaurantId,
    required this.orderNumber,
    required this.quantity,
    required this.orderType,
    required this.orderStatusId,
    required this.subTotal,
    required this.amount,
    required this.paymentStatus,
    required this.details,
    required this.isActive,
    required this.id,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String userId;
  String restaurantId;
  String orderNumber;
  int quantity;
  String orderType;
  String orderStatusId;
  int subTotal;
  int amount;
  String paymentStatus;
  String details;
  bool isActive;
  String id;
  String orderDate;
  String createdAt;
  String updatedAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    userId: json["UserId"] ?? "",
    restaurantId: json["RestaurantId"] ?? "",
    orderNumber: json["OrderNumber"] ?? "",
    quantity: json["Quantity"] ?? 0,
    orderType: json["OrderType"] ?? "",
    orderStatusId: json["OrderStatusId"] ?? "",
    subTotal: json["SubTotal"] ?? 0,
    amount: json["Amount"] ?? 0,
    paymentStatus: json["PaymentStatus"] ?? "",
    details: json["Details"]?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    orderDate: json["OrderDate"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "RestaurantId": restaurantId,
    "OrderNumber": orderNumber,
    "Quantity": quantity,
    "OrderType": orderType,
    "OrderStatusId": orderStatusId,
    "SubTotal": subTotal,
    "Amount": amount,
    "PaymentStatus": paymentStatus,
    "Details": details,
    "IsActive": isActive,
    "_id": id,
    "OrderDate": orderDate,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Orderitem {
  Orderitem({
    required this.orderId,
    required this.orderNumber,
    required this.productId,
    required this.quantity,
    required this.productPrice,
    required this.itemTotalPrice,
    required this.isActive,
    required this.id,
    required this.v,
  });

  String orderId;
  String orderNumber;
  String productId;
  int quantity;
  int productPrice;
  int itemTotalPrice;
  bool isActive;
  String id;
  int v;

  factory Orderitem.fromJson(Map<String, dynamic> json) => Orderitem(
    orderId: json["OrderId"] ?? "",
    orderNumber: json["OrderNumber"] ?? "",
    productId: json["ProductId"] ?? "",
    quantity: json["Quantity"] ?? 0,
    productPrice: json["ProductPrice"] ?? 0,
    itemTotalPrice: json["ItemTotalPrice"] ?? 0,
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "OrderId": orderId,
    "OrderNumber": orderNumber,
    "ProductId": productId,
    "Quantity": quantity,
    "ProductPrice": productPrice,
    "ItemTotalPrice": itemTotalPrice,
    "IsActive": isActive,
    "_id": id,
    "__v": v,
  };
}
