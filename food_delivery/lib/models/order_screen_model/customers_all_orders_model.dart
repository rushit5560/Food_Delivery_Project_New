// To parse this JSON data, do
//
//     final customersAllOrdersModel = customersAllOrdersModelFromJson(jsonString);

/*import 'dart:convert';

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
}*/

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
    required this.userId,
    required this.restaurantId,
    required this.orderNumber,
    required this.quantity,
    required this.deliveryBy,
    required this.subTotal,
    required this.amount,
    required this.paymentStatus,
    required this.details,
    required this.isActive,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.orderStatusId,
  });


  String id;
  UserId userId;
  RestaurantId restaurantId;
  String orderNumber;
  int quantity;
  DeliveryBy deliveryBy;
  int subTotal;
  int amount;
  String paymentStatus;
  String details;
  bool isActive;
  DateTime orderDate;
  String createdAt;
  String updatedAt;
  int v;
  OrderStatusId orderStatusId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"] ?? "",
    userId: UserId.fromJson(json["UserId"] ?? {}),
    restaurantId: RestaurantId.fromJson(json["RestaurantId"] ?? {}),
    orderNumber: json["OrderNumber"] ?? "",
    quantity: json["Quantity"] ?? 0,
    deliveryBy: DeliveryBy.fromJson(json["DeliveryBy"] ?? {}),
    subTotal: json["SubTotal"] ?? 0,
    amount: json["Amount"] ?? 0,
    paymentStatus: json["PaymentStatus"] ?? "",
    details: json["Details"] ?? "",
    isActive: json["IsActive"] ?? false,
    orderDate: DateTime.parse(json["OrderDate"] ?? DateTime.now()),
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    orderStatusId: OrderStatusId.fromJson(json["OrderStatusId"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserId": userId.toJson(),
    "RestaurantId": restaurantId.toJson(),
    "OrderNumber": orderNumber,
    "Quantity": quantity,
    "DeliveryBy": deliveryBy.toJson(),
    "SubTotal": subTotal,
    "Amount": amount,
    "PaymentStatus": paymentStatus,
    "Details": details,
    "IsActive": isActive,
    "OrderDate": orderDate.toIso8601String(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "OrderStatusId": orderStatusId.toJson()
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

class DeliveryBy {
  DeliveryBy({
    required this.reseLink,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.gender,
    required this.zone,
    required this.roleId,
    required this.address,
    required this.deliveryManType,
    required this.identityType,
    required this.identityNumber,
    required this.isActive,
    required this.email,
    required this.identityImage,
    required this.isVerified,
    required this.v,
    required this.restaurant,
    //required this.rating,
    required this.numberOfReviews,
    required this.isSuspended,
    required this.image,
  });

  String reseLink;
  String id;
  String firstName;
  String lastName;
  int phone;
  String password;
  String gender;
  String zone;
  String roleId;
  String address;
  String deliveryManType;
  String identityType;
  String identityNumber;
  bool isActive;
  String email;
  String identityImage;
  bool isVerified;
  int v;
  String restaurant;
  //double rating;
  int numberOfReviews;
  bool isSuspended;
  String image;

  factory DeliveryBy.fromJson(Map<String, dynamic> json) => DeliveryBy(
    reseLink: json["reseLink"] ?? "",
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    phone: json["Phone"] ?? 0,
    password: json["Password"] ?? "",
    gender: json["Gender"] ?? "",
    zone: json["Zone"] ?? "",
    roleId: json["RoleId"] ?? "",
    address: json["Address"] ?? "",
    deliveryManType: json["DeliveryManType"] ?? "",
    identityType: json["IdentityType"] ?? "",
    identityNumber: json["IdentityNumber"] ?? "",
    isActive: json["IsActive"] ?? false,
    email: json["Email"] ?? "",
    identityImage: json["IdentityImage"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    v: json["__v"] ?? 0,
    restaurant: json["Restaurant"] ?? "",
    //rating: json["Rating"] ?? 0.0,
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    isSuspended: json["IsSuspended"] ?? false,
    image: json["Image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "reseLink": reseLink,
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "Zone": zone,
    "RoleId": roleId,
    "Address": address,
    "DeliveryManType": deliveryManType,
    "IdentityType": identityType,
    "IdentityNumber": identityNumber,
    "IsActive": isActive,
    "Email": email,
    "IdentityImage": identityImage,
    "IsVerified": isVerified,
    "__v": v,
    "Restaurant": restaurant,
    //"Rating": rating,
    "NumberOfReviews": numberOfReviews,
    "IsSuspended": isSuspended,
    "Image": image,
  };
}

class RestaurantId {
  RestaurantId({
    required this.reseLink,
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
    required this.campaignjoin,
    required this.numberOfReviews,
    required this.rating,
  });

  String reseLink;
  String id;
  String storeName;
  String address;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  String startTime;
  String endTime;
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
  List<dynamic> campaignjoin;
  int numberOfReviews;
  int rating;

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    reseLink: json["reseLink"] ?? "",
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    address: json["Address"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ??"",
    coverImage: json["CoverImage"] ?? "",
    roleId: json["RoleId"] ?? "",
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
    zone: json["Zone"] ?? "",
    campaignjoin: List<dynamic>.from(json["campaignjoin"].map((x) => x) ?? {}),
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "reseLink": reseLink,
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
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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
    required this.gender,
    required this.isActive,
    required this.roleId,
    required this.isVerified,
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
  String gender;
  bool isActive;
  String roleId;
  bool isVerified;
  String createdAt;
  String updatedAt;
  int v;
  String lastLogin;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"] ?? "",
    userName: json["UserName"] ?? "",
    fullName: json["FullName"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    address: json["Address"] ?? "",
    gender: json["Gender"] ?? "",
    isActive: json["IsActive"] ?? false,
    roleId: json["RoleId"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    lastLogin: json["LastLogin"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserName": userName,
    "FullName": fullName,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Address": address,
    "Gender": gender,
    "IsActive": isActive,
    "RoleId": roleId,
    "IsVerified": isVerified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "LastLogin": lastLogin,
  };
}

