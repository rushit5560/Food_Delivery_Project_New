// To parse this JSON data, do
//
//     final getProductReviewModel = getProductReviewModelFromJson(jsonString);

import 'dart:convert';

GetProductReviewModel getProductReviewModelFromJson(String str) => GetProductReviewModel.fromJson(json.decode(str));

String getProductReviewModelToJson(GetProductReviewModel data) => json.encode(data.toJson());

class GetProductReviewModel {
  GetProductReviewModel({
    required this.status,
    required this.review,
  });

  bool status;
  List<Review> review;

  factory GetProductReviewModel.fromJson(Map<String, dynamic> json) => GetProductReviewModel(
    status: json["status"] ?? false,
    review: List<Review>.from(json["review"].map((x) => Review.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "review": List<dynamic>.from(review.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    required this.id,
    required this.product,
    required this.customer,
    required this.restaurant,
    required this.review,
    required this.rating,
    required this.date,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  Product product;
  Customer customer;
  Restaurant restaurant;
  String review;
  String rating;
  DateTime date;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["_id"] ?? "",
    product: Product.fromJson(json["Product"] ?? {}),
    customer: Customer.fromJson(json["Customer"] ?? {}),
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    review: json["Review"] ?? "",
    rating: json["Rating"] ?? "",
    date: DateTime.parse(json["Date"] ?? DateTime.now()),
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Product": product.toJson(),
    "Customer": customer.toJson(),
    "Restaurant": restaurant.toJson(),
    "Review": review,
    "Rating": rating,
    "Date": date.toIso8601String(),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Customer {
  Customer({
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
  String createdAt;
  String updatedAt;
  int v;
  String lastLogin;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
    "CityId": cityId,
    "AreaId": areaId,
    "Gender": gender,
    "Photo": photo,
    "IsActive": isActive,
    "RoleId": roleId,
    "IsVerified": isVerified,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "LastLogin": lastLogin,
  };
}

class Product {
  Product({
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
  String image;
  bool isApproved;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    image: json["Image"] ?? "",
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
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

class Restaurant {
  Restaurant({
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

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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
    isActive: json["IsActive"] ?? "",
    isApproved: json["IsApproved"] ?? "",
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
  };
}
