// To parse this JSON data, do
//
//     final orderDetailsScreenModel = orderDetailsScreenModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsScreenModel orderDetailsScreenModelFromJson(String str) => OrderDetailsScreenModel.fromJson(json.decode(str));

String orderDetailsScreenModelToJson(OrderDetailsScreenModel data) => json.encode(data.toJson());

class OrderDetailsScreenModel {
  OrderDetailsScreenModel({
    required this.status,
    required this.message,
    required this.order,
    required this.orderitem,
  });

  bool status;
  String message;
  Order order;
  List<Orderitem> orderitem;

  factory OrderDetailsScreenModel.fromJson(Map<String, dynamic> json) => OrderDetailsScreenModel(
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
    required this.id,
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
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  UserId userId;
  RestaurantId restaurantId;
  String orderNumber;
  int quantity;
  String orderType;
  OrderStatusId orderStatusId;
  int subTotal;
  int amount;
  String paymentStatus;
  String details;
  bool isActive;
  String orderDate;
  String createdAt;
  String updatedAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"] ?? "",
    userId: UserId.fromJson(json["UserId"] ?? {}),
    restaurantId: RestaurantId.fromJson(json["RestaurantId"] ?? {}),
    orderNumber: json["OrderNumber"] ?? "",
    quantity: json["Quantity"] ?? 0,
    orderType: json["OrderType"] ?? "",
    orderStatusId: OrderStatusId.fromJson(json["OrderStatusId"] ?? {}),
    subTotal: json["SubTotal"] ?? 0,
    amount: json["Amount"] ?? 0,
    paymentStatus: json["PaymentStatus"] ?? "",
    details: json["Details"] ?? "",
    isActive: json["IsActive"] ?? false,
    orderDate: json["OrderDate"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserId": userId.toJson(),
    "RestaurantId": restaurantId.toJson(),
    "OrderNumber": orderNumber,
    "Quantity": quantity,
    "OrderType": orderType,
    "OrderStatusId": orderStatusId.toJson(),
    "SubTotal": subTotal,
    "Amount": amount,
    "PaymentStatus": paymentStatus,
    "Details": details,
    "IsActive": isActive,
    "OrderDate": orderDate,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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
    required this.role,
  });

  String id;
  String status;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String role;

  factory OrderStatusId.fromJson(Map<String, dynamic> json) => OrderStatusId(
    id: json["_id"] ?? "",
    status: json["Status"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    role: json["Role"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Status": status,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Role": role,
  };
}

class RestaurantId {
  RestaurantId({
    required this.numberOfReviews,
    //required this.rating,
    required this.id,
    required this.storeName,
    required this.tax,
    required this.address,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.zone,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.isActive,
    required this.isApproved,
    required this.approvedOn,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.latitude,
    required this.longitude,
    required this.coverImage,
    required this.image,
    required this.campaignjoin,
  });

  int numberOfReviews;
  //int rating;
  String id;
  String storeName;
  String tax;
  String address;
  String minDeliveryTime;
  String maxDeliveryTime;
  String zone;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  String startTime;
  String endTime;
  bool isActive;
  bool isApproved;
  String approvedOn;
  int v;
  String createdAt;
  String updatedAt;
  String latitude;
  String longitude;
  String coverImage;
  String image;
  List<dynamic> campaignjoin;

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    numberOfReviews: json["NumberOfReviews"]?? 0,
    //rating: json["Rating"] ?? 0,
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    tax: json["Tax"] ?? "",
    address: json["Address"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    zone: json["Zone"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    approvedOn: json["ApprovedOn"] ?? "",
    v: json["__v"] ?? 0,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    coverImage: json["CoverImage"] ?? "",
    image: json["Image"] ?? "",
    campaignjoin: List<dynamic>.from(json["campaignjoin"].map((x) => x) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "NumberOfReviews": numberOfReviews,
    //"Rating": rating,
    "_id": id,
    "StoreName": storeName,
    "Tax": tax,
    "Address": address,
    "MinDeliveryTime": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime,
    "Zone": zone,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "ApprovedOn": approvedOn,
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "Latitude": latitude,
    "Longitude": longitude,
    "CoverImage": coverImage,
    "Image": image,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
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
    required this.isActive,
    required this.roleId,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastLogin,
    required this.photo,
  });

  String id;
  String userName;
  String fullName;
  String phone;
  String email;
  String password;
  String address;
  bool isActive;
  String roleId;
  bool isVerified;
  String createdAt;
  String updatedAt;
  int v;
  String lastLogin;
  String photo;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"] ?? "",
    userName: json["UserName"] ?? "",
    fullName: json["FullName"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    address: json["Address"] ?? "",
    isActive: json["IsActive"] ?? false,
    roleId: json["RoleId"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    lastLogin: json["LastLogin"] ?? "",
    photo: json["Photo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserName": userName,
    "FullName": fullName,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Address": address,
    "IsActive": isActive,
    "RoleId": roleId,
    "IsVerified": isVerified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "LastLogin": lastLogin,
    "Photo": photo,
  };
}

class Orderitem {
  Orderitem({
    required this.id,
    required this.orderId,
    required this.orderNumber,
    required this.productId,
    required this.quantity,
    required this.productPrice,
    required this.itemTotalPrice,
    required this.isActive,
    required this.v,
  });

  String id;
  String orderId;
  String orderNumber;
  ProductId productId;
  int quantity;
  int productPrice;
  int itemTotalPrice;
  bool isActive;
  int v;

  factory Orderitem.fromJson(Map<String, dynamic> json) => Orderitem(
    id: json["_id"] ?? "",
    orderId: json["OrderId"] ?? "",
    orderNumber: json["OrderNumber"] ?? "",
    productId: ProductId.fromJson(json["ProductId"] ?? {}),
    quantity: json["Quantity"] ?? 0,
    productPrice: json["ProductPrice"] ?? 0,
    itemTotalPrice: json["ItemTotalPrice"] ?? 0,
    isActive: json["IsActive"] ?? false,
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "OrderId": orderId,
    "OrderNumber": orderNumber,
    "ProductId": productId.toJson(),
    "Quantity": quantity,
    "ProductPrice": productPrice,
    "ItemTotalPrice": itemTotalPrice,
    "IsActive": isActive,
    "__v": v,
  };
}

class ProductId {
  ProductId({
    required this.productType,
    required this.discountType,
    required this.id,
    required this.category,
    required this.subCategory,
    required this.store,
    required this.discount,
    required this.productName,
    required this.quantity,
    required this.mrp,
    required this.price,
    required this.startTime,
    required this.endTime,
    required this.attribute,
    required this.addon,
    required this.isFeatured,
    required this.description,
    required this.numberOfReviews,
    //required this.rating,
    required this.image,
    required this.isApproved,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  TType productType;
  TType discountType;
  String id;
  String category;
  String subCategory;
  String store;
  int discount;
  String productName;
  int quantity;
  int mrp;
  int price;
  String startTime;
  String endTime;
  List<Addon> attribute;
  List<Addon> addon;
  bool isFeatured;
  String description;
  int numberOfReviews;
  //double rating;
  String image;
  bool isApproved;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    productType: TType.fromJson(json["ProductType"] ?? {}),
    discountType: TType.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    category: json["Category"] ?? "",
    subCategory: json["SubCategory"] ?? "",
    store: json["Store"] ?? "",
    discount: json["Discount"] ?? 0,
    productName: json["ProductName"] ?? "",
    quantity: json["Quantity"] ?? 0,
    mrp: json["MRP"] ?? 0,
    price: json["Price"] ?? 0,
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x)) ?? {}),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? {}),
    isFeatured: json["IsFeatured"] ?? false,
    description: json["Description"] ?? "",
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    //rating: json["Rating"] ?? 0.0,
    image: json["Image"] ?? "",
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__"] ?? 0
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType.toJson(),
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Category": category,
    "SubCategory": subCategory,
    "Store": store,
    "Discount": discount,
    "ProductName": productName,
    "Quantity": quantity,
    "MRP": mrp,
    "Price": price,
    "StartTime": startTime,
    "EndTime": endTime,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "IsFeatured": isFeatured,
    "Description": description,
    "NumberOfReviews": numberOfReviews,
    //"Rating": rating,
    "Image": image,
    "IsApproved": isApproved,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  String value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: json["value"] ?? "",
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
    "_id": id,
  };
}

class TType {
  TType({
    required this.value,
    required this.label,
  });

  String value;
  String label;

  factory TType.fromJson(Map<String, dynamic> json) => TType(
    value: json["value"] ?? "",
    label: json["label"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}
