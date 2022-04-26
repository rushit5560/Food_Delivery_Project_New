import 'dart:convert';

SearchCategoryModel searchCategoryModelFromJson(String str) => SearchCategoryModel.fromJson(json.decode(str));

String searchCategoryModelToJson(SearchCategoryModel data) => json.encode(data.toJson());

class SearchCategoryModel {
  SearchCategoryModel({
    required this.status,
    required this.category,
  });

  bool status;
  List<SearchCategory> category;

  factory SearchCategoryModel.fromJson(Map<String, dynamic> json) => SearchCategoryModel(
    status: json["status"] ?? false,
    category: List<SearchCategory>.from(json["category"].map((x) => SearchCategory.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class SearchCategory {
  SearchCategory({
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
  Restaurant restaurant;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory SearchCategory.fromJson(Map<String, dynamic> json) => SearchCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant.toJson(),
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Restaurant {
  Restaurant({
    required this.numberOfReviews,
    required this.rating,
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
    required this.roleId,
    required this.createdBy,
    required this.updatedBy,
  });

  int numberOfReviews;
  double rating;
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
  List<String> campaignjoin;
  String roleId;
  String createdBy;
  String updatedBy;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toDouble(),
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
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
    roleId: json["RoleId"] ?? "",
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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
    "RoleId": roleId,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
  };
}

