// To parse this JSON data, do
//
//     final getWishlistFoodModel = getWishlistFoodModelFromJson(jsonString);

import 'dart:convert';

GetWishlistFoodModel getWishlistFoodModelFromJson(String str) => GetWishlistFoodModel.fromJson(json.decode(str));

String getWishlistFoodModelToJson(GetWishlistFoodModel data) => json.encode(data.toJson());

class GetWishlistFoodModel {
  GetWishlistFoodModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElement> list;

  factory GetWishlistFoodModel.fromJson(Map<String, dynamic> json) => GetWishlistFoodModel(
    status: json["status"],
    message: json["message"],
    list: List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.id,
    this.userId,
    this.restaurantId,
    this.productId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String userId;
  RestaurantId restaurantId;
  ProductId productId;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["_id"],
    userId: json["UserId"],
    restaurantId: RestaurantId.fromJson(json["RestaurantId"]),
    productId: ProductId.fromJson(json["ProductId"]),
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserId": userId,
    "RestaurantId": restaurantId.toJson(),
    "ProductId": productId.toJson(),
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class ProductId {
  ProductId({
    this.productType,
    this.discountType,
    this.id,
    this.category,
    this.subCategory,
    this.store,
    this.discount,
    this.productName,
    this.quantity,
    this.mrp,
    this.price,
    this.startTime,
    this.endTime,
    this.attribute,
    this.addon,
    this.isFeatured,
    this.description,
    this.numberOfReviews,
    this.rating,
    this.image,
    this.isApproved,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
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
  int rating;
  String image;
  bool isApproved;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    productType: TType.fromJson(json["ProductType"]),
    discountType: TType.fromJson(json["DiscountType"]),
    id: json["_id"],
    category: json["Category"],
    subCategory: json["SubCategory"],
    store: json["Store"],
    discount: json["Discount"],
    productName: json["ProductName"],
    quantity: json["Quantity"],
    mrp: json["MRP"],
    price: json["Price"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))),
    isFeatured: json["IsFeatured"],
    description: json["Description"],
    numberOfReviews: json["NumberOfReviews"],
    rating: json["Rating"],
    image: json["Image"],
    isApproved: json["IsApproved"],
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
    "Rating": rating,
    "Image": image,
    "IsApproved": isApproved,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Addon {
  Addon({
    this.value,
    this.label,
    this.id,
  });

  String value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: json["value"],
    label: json["label"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
    "_id": id,
  };
}

class TType {
  TType({
    this.value,
    this.label,
  });

  String value;
  String label;

  factory TType.fromJson(Map<String, dynamic> json) => TType(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class RestaurantId {
  RestaurantId({
    this.reseLink,
    this.id,
    this.storeName,
    this.address,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.deliveryRange,
    this.startTime,
    this.endTime,
    this.image,
    this.coverImage,
    this.roleId,
    this.isActive,
    this.isApproved,
    this.createdBy,
    this.updatedBy,
    this.approvedOn,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.latitude,
    this.longitude,
    this.maxDeliveryTime,
    this.minDeliveryTime,
    this.tax,
    this.zone,
    this.campaignjoin,
    this.numberOfReviews,
    this.rating,
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
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String latitude;
  String longitude;
  String maxDeliveryTime;
  String minDeliveryTime;
  String tax;
  String zone;
  List<String> campaignjoin;
  int numberOfReviews;
  int rating;

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    reseLink: json["reseLink"],
    id: json["_id"],
    storeName: json["StoreName"],
    address: json["Address"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    password: json["Password"],
    phone: json["Phone"],
    deliveryRange: json["DeliveryRange"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    image: json["Image"],
    coverImage: json["CoverImage"],
    roleId: json["RoleId"],
    isActive: json["IsActive"],
    isApproved: json["IsApproved"],
    createdBy: json["CreatedBy"],
    updatedBy: json["UpdatedBy"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    maxDeliveryTime: json["MaxDeliveryTime"],
    minDeliveryTime: json["MinDeliveryTime"],
    tax: json["Tax"],
    zone: json["Zone"],
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x)),
    numberOfReviews: json["NumberOfReviews"],
    rating: json["Rating"],
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
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
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
