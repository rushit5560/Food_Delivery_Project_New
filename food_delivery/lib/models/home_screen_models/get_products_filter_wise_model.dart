// To parse this JSON data, do
//
//     final getProductsFilterWiseModel = getProductsFilterWiseModelFromJson(jsonString);

import 'dart:convert';

GetProductsFilterWiseModel getProductsFilterWiseModelFromJson(String str) => GetProductsFilterWiseModel.fromJson(json.decode(str));

String getProductsFilterWiseModelToJson(GetProductsFilterWiseModel data) => json.encode(data.toJson());

class GetProductsFilterWiseModel {
  GetProductsFilterWiseModel({
    required this.status,
    required this.message,
    required this.list,
    required this.bestReviewList,
  });

  bool status;
  String message;
  List<BestReviewListElement> list;
  List<BestReviewListElement> bestReviewList;

  factory GetProductsFilterWiseModel.fromJson(Map<String, dynamic> json) => GetProductsFilterWiseModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<BestReviewListElement>.from(json["List"].map((x) => BestReviewListElement.fromJson(x)) ?? {}),
    bestReviewList: List<BestReviewListElement>.from(json["BestReviewList"].map((x) => BestReviewListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
    "BestReviewList": List<dynamic>.from(bestReviewList.map((x) => x.toJson())),
  };
}

class BestReviewListElement {
  BestReviewListElement({
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
    required this.rating,
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
  ReviewCategory category;
  ReviewSubCategory subCategory;
  ReviewStore store;
  int discount;
  String productName;
  int quantity;
  int mrp;
  int price;
  String startTime;
  String endTime;
  List<BestReviewAttribute> attribute;
  List<BestReviewAddon> addon;
  bool isFeatured;
  String description;
  int numberOfReviews;
  int rating;
  String image;
  bool isApproved;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory BestReviewListElement.fromJson(Map<String, dynamic> json) => BestReviewListElement(
    productType: TType.fromJson(json["ProductType"]),
    discountType: TType.fromJson(json["DiscountType"]),
    id: json["_id"],
    category: ReviewCategory.fromJson(json["Category"]),
    subCategory: ReviewSubCategory.fromJson(json["SubCategory"]),
    store: ReviewStore.fromJson(json["Store"]),
    discount: json["Discount"],
    productName: json["ProductName"],
    quantity: json["Quantity"],
    mrp: json["MRP"],
    price: json["Price"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    attribute: List<BestReviewAttribute>.from(json["Attribute"].map((x) => BestReviewAttribute.fromJson(x))),
    addon: List<BestReviewAddon>.from(json["Addon"].map((x) => BestReviewAddon.fromJson(x))),
    isFeatured: json["IsFeatured"],
    description: json["Description"],
    numberOfReviews: json["NumberOfReviews"],
    rating: json["Rating"],
    image: json["Image"],
    isApproved: json["IsApproved"],
    isActive: json["IsActive"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType.toJson(),
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Category": category.toJson(),
    "SubCategory": subCategory.toJson(),
    "Store": store.toJson(),
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
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

class ReviewCategory {
  ReviewCategory({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String restaurant;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ReviewCategory.fromJson(Map<String, dynamic> json) => ReviewCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class ReviewSubCategory {
  ReviewSubCategory({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String category;
  String name;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ReviewSubCategory.fromJson(Map<String, dynamic> json) => ReviewSubCategory(
    id: json["_id"] ?? "",
    category: json["Category"] ?? "",
    name: json["Name"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category,
    "Name": name,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class ReviewStore {
  ReviewStore({
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
  List<String> campaignjoin;
  int numberOfReviews;
  double rating;

  factory ReviewStore.fromJson(Map<String, dynamic> json) => ReviewStore(
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
    image: json["Image"] ?? "",
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
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: double.parse(json["Rating"].toString()),
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


class BestReviewAttribute {
  BestReviewAttribute({
    required this.value,
    required this.label,
    required this.id,
  });

  Value value;
  String label;
  String id;

  factory BestReviewAttribute.fromJson(Map<String, dynamic> json) => BestReviewAttribute(
    value: Value.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}
class Value {
  Value({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class BestReviewAddon {
  BestReviewAddon({
    required this.value,
    required this.label,
    required this.id,
  });

  Value1 value;
  String label;
  String id;

  factory BestReviewAddon.fromJson(Map<String, dynamic> json) => BestReviewAddon(
    value: Value1.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}
class Value1 {
  Value1({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  int v;
  String createdAt;
  String updatedAt;

  factory Value1.fromJson(Map<String, dynamic> json) => Value1(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ??  "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    v: json["__v"] ?? 0,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant,
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}