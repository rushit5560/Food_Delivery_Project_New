/*
import 'dart:convert';

FoodCampaignModel foodCampaignModelFromJson(String str) => FoodCampaignModel.fromJson(json.decode(str));

String foodCampaignModelToJson(FoodCampaignModel data) => json.encode(data.toJson());

class FoodCampaignModel {
  FoodCampaignModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElement> list;

  factory FoodCampaignModel.fromJson(Map<String, dynamic> json) => FoodCampaignModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "" : json["message"],
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
    required this.id,
    required this.title,
    required this.zone,
    required this.restaurant,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.discount,
    required this.category,
    required this.subCategory,
    required this.attribute,
    required this.addon,
    required this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  Zone zone;
  Restaurant restaurant;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  String price;
  String discount;
  String category;
  String subCategory;
  List<Addon> attribute;
  List<Addon> addon;
  String description;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["_id"] == null ? "" : json["_id"],
    title: json["Title"] == null ? "" : json["Title"],
    zone: Zone.fromJson(json["Zone"]),
    restaurant: Restaurant.fromJson(json["Restaurant"]),
    startDate: DateTime.parse(json["StartDate"]),
    endDate: DateTime.parse(json["EndDate"]),
    startTime: json["StartTime"] == null ? "" : json["StartTime"],
    endTime: json["EndTime"] == null ? "" : json["EndTime"],
    price: json["Price"] == null ? "" : json["Price"],
    discount: json["Discount"] == null ? "" : json["Discount"],
    category: json["Category"] == null ? "" : json["Category"],
    subCategory: json["SubCategory"] == null ? "" : json["SubCategory"],
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))),
    description: json["Description"] == null ? "" : json["Description"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "Zone": zone.toJson(),
    "Restaurant": restaurant.toJson(),
    "StartDate": startDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
    "StartTime": startTime,
    "EndTime": endTime,
    "Price": price,
    "Discount": discount,
    "Category": category,
    "SubCategory": subCategory,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "Description": description,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  Zone value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: Zone.fromJson(json["value"]),
    label: json["label"] == null ? "" : json["label"],
    id: json["_id"] == null ? "" : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}

class Zone {
  Zone({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.coordinates,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String coordinates;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    id: json["_id"] == null ? "" : json["_id"],
    restaurant: json["Restaurant"] == null ? "" : json["Restaurant"],
    name: json["Name"] == null ? "" : json["Name"],
    price: json["Price"] == null ? "" : json["Price"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
    coordinates: json["Coordinates"] == null ? "" : json["Coordinates"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant == null ? null : restaurant,
    "Name": name,
    "Price": price == null ? null : price,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Coordinates": coordinates == null ? null : coordinates,
  };
}

class Restaurant {
  Restaurant({
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

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"] == null ? "" : json["_id"],
    storeName: json["StoreName"] == null ? "" : json["StoreName"],
    tax: json["Tax"] == null ? "" : json["Tax"],
    address: json["Address"] == null ? "" : json["Address"],
    minDeliveryTime: json["MinDeliveryTime"] == null ? "" : json["MinDeliveryTime"],
    maxDeliveryTime: json["MaxDeliveryTime"] == null ? "" : json["MaxDeliveryTime"],
    zone: json["Zone"] == null ? "" : json["Zone"],
    latitude: json["Latitude"] == null ? "" : json["Latitude"],
    longitude: json["Longitude"] == null ? "" : json["Longitude"],
    firstName: json["FirstName"] == null ? "" : json["FirstName"],
    lastName: json["LastName"] == null ? "" : json["LastName"],
    email: json["Email"] == null ? "" : json["Email"],
    password: json["Password"] == null ? "" : json["Password"],
    phone: json["Phone"] == null ? 0 : json["Phone"],
    deliveryRange: json["DeliveryRange"] == null ? "" : json["DeliveryRange"],
    startTime: json["StartTime"] == null ? "" : json["StartTime"],
    endTime: json["EndTime"] == null ? "" : json["EndTime"],
    roleId: json["RoleId"] == null ? "" : json["RoleId"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
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
*/

// To parse this JSON data, do
//
//     final foodCampaignModel = foodCampaignModelFromJson(jsonString);

import 'dart:convert';

FoodCampaignModel foodCampaignModelFromJson(String str) => FoodCampaignModel.fromJson(json.decode(str));

String foodCampaignModelToJson(FoodCampaignModel data) => json.encode(data.toJson());

class FoodCampaignModel {
  FoodCampaignModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElement> list;

  factory FoodCampaignModel.fromJson(Map<String, dynamic> json) => FoodCampaignModel(
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
    required this.itemType,
    required this.discountType,
    required this.id,
    required this.title,
    required this.zone,
    required this.restaurant,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.discount,
    required this.category,
    required this.subCategory,
    required this.attribute,
    required this.addon,
    required this.description,
    required this.foodImage,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Type itemType;
  Type discountType;
  String id;
  String title;
  Zone zone;
  Restaurant restaurant;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  String price;
  String discount;
  String category;
  String subCategory;
  List<Addon> attribute;
  List<Addon> addon;
  String description;
  String foodImage;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    itemType: json["ItemType"] == null ? "" : json["ItemType"],
    discountType: json["DiscountType"] == null ? "" : json["DiscountType"],
    id: json["_id"] == null ? "" : json["_id"],
    title: json["Title"] == null ? "" : json["Title"],
    zone: Zone.fromJson(json["Zone"]),
    restaurant: Restaurant.fromJson(json["Restaurant"]),
    startDate: DateTime.parse(json["StartDate"]),
    endDate: DateTime.parse(json["EndDate"]),
    startTime: json["StartTime"] == null ? "" : json["StartTime"],
    endTime: json["EndTime"],
    price: json["Price"] == null ? "" : json["Price"],
    discount: json["Discount"] == null ? "" : json["Discount"],
    category: json["Category"] == null ? "" : json["Category"],
    subCategory: json["SubCategory"] == null ? "" : json["SubCategory"],
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))),
    description: json["Description"] == null ? "" : json["Description"],
    foodImage: json["FoodImage"] == null ? null : json["FoodImage"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "ItemType": itemType == null ? null : itemType.toJson(),
    "DiscountType": discountType == null ? null : discountType.toJson(),
    "_id": id,
    "Title": title,
    "Zone": zone.toJson(),
    "Restaurant": restaurant.toJson(),
    "StartDate": startDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
    "StartTime": startTime,
    "EndTime": endTime,
    "Price": price,
    "Discount": discount,
    "Category": category,
    "SubCategory": subCategory,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "Description": description,
    "FoodImage": foodImage == null ? null : foodImage,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  Zone value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: json["value"],
    label: json["label"] == null ? "" : json["label"],
    id: json["_id"] == null ? "" : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value.toJson(),
    "label": label,
    "_id": id,
  };
}

class Zone {
  Zone({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.coordinates,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String coordinates;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    id: json["_id"] == null ? "" : json["_id"],
    restaurant: json["Restaurant"] == null ? "" : json["Restaurant"],
    name: json["Name"] == null ? "" : json["Name"],
    price: json["Price"] == null ? "" : json["Price"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? "" : json["__v"],
    coordinates: json["Coordinates"] == null ? "" : json["Coordinates"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant == null ? null : restaurant,
    "Name": name,
    "Price": price == null ? null : price,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Coordinates": coordinates == null ? null : coordinates,
  };
}

class Type {
  Type({
    required this.value,
    required this.label,
  });

  String value;
  String label;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    value: json["value"] == null ? "" : json["value"],
    label: json["label"] == null ? "" : json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class Restaurant {
  Restaurant({
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
    required this.image,
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
  String image;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"] == null ? "" : json["_id"],
    storeName: json["StoreName"] == null ? "" : json["StoreName"],
    tax: json["Tax"] == null ? "" : json["Tax"],
    address: json["Address"] == null ? "" :json["Address"],
    minDeliveryTime: json["MinDeliveryTime"] == null ? "" : json["MinDeliveryTime"],
    maxDeliveryTime: json["MaxDeliveryTime"] == null ? "" : json["MaxDeliveryTime"],
    zone: json["Zone"] == null ? "" : json["Zone"],
    latitude: json["Latitude"] == null ? "" : json["Latitude"],
    longitude: json["Longitude"] == null ? "" : json["Longitude"],
    firstName: json["FirstName"] == null ? "" : json["FirstName"],
    lastName: json["LastName"] == null ? "" : json["LastName"],
    email: json["Email"] == null ? "" : json["Email"],
    password: json["Password"] == null ? "" : json["Password"],
    phone: json["Phone"] == null ? 0 : json["Phone"],
    deliveryRange: json["DeliveryRange"] == null ? "" : json["DeliveryRange"],
    startTime: json["StartTime"] == null ? "" : json["StartTime"],
    endTime: json["EndTime"] == null ? "" : json["EndTime"],
    image: json["Image"] == null ? "" : json["Image"],
    roleId: json["RoleId"] == null ? "" : json["RoleId"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    createdBy: json["CreatedBy"] == null ? "" : json["CreatedBy"],
    updatedBy: json["UpdatedBy"] == null ? "" : json["UpdatedBy"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
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
    "Image": image == null ? null : image,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy == null ? null : createdBy,
    "UpdatedBy": updatedBy == null ? null : updatedBy,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
