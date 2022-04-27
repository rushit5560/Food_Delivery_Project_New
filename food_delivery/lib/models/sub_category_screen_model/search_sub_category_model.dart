import 'dart:convert';

SearchSubCategoryModel searchSubCategoryModelFromJson(String str) => SearchSubCategoryModel.fromJson(json.decode(str));

String searchSubCategoryModelToJson(SearchSubCategoryModel data) => json.encode(data.toJson());

class SearchSubCategoryModel {
  SearchSubCategoryModel({
    required this.status,
    required this.category,
  });

  bool status;
  List<SearchSbCategory> category;

  factory SearchSubCategoryModel.fromJson(Map<String, dynamic> json) => SearchSubCategoryModel(
    status: json["status"] ?? false,
    category: List<SearchSbCategory>.from(json["category"].map((x) => SearchSbCategory.fromJson(x)) ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class SearchSbCategory {
  SearchSbCategory({
    required this.id,
    required this.category,
    required this.restaurant,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
  });

  String id;
  SearchSbCategoryClass category;
  SearchSbRestaurant restaurant;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String image;

  factory SearchSbCategory.fromJson(Map<String, dynamic> json) => SearchSbCategory(
    id: json["_id"] ?? "",
    category: SearchSbCategoryClass.fromJson(json["Category"] ?? {}),
    restaurant: SearchSbRestaurant.fromJson(json["Restaurant"] ?? {}),
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    image: json["Image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category.toJson(),
    // "Restaurant": restaurant.toJson(),
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Image": image,
  };
}

class SearchSbCategoryClass {
  SearchSbCategoryClass({
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

  factory SearchSbCategoryClass.fromJson(Map<String, dynamic> json) => SearchSbCategoryClass(
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

class SearchSbRestaurant {
  SearchSbRestaurant({
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
    required this.numberOfReviews,
    required this.rating,
    required this.campaignjoin,
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
  int numberOfReviews;
  double rating;
  List<String> campaignjoin;

  factory SearchSbRestaurant.fromJson(Map<String, dynamic> json) => SearchSbRestaurant(
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
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"] ?? 0.0,
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
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
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
  };
}
