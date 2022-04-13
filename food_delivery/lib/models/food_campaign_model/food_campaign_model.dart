import 'dart:convert';

GetFoodCampaignModel getFoodCampaignModelFromJson(String str) => GetFoodCampaignModel.fromJson(json.decode(str));

String getFoodCampaignModelToJson(GetFoodCampaignModel data) => json.encode(data.toJson());

class GetFoodCampaignModel {
  GetFoodCampaignModel({
    required this.status,
    required this.message,
    required this.getList,
  });

  bool status;
  String message;
  List<GetCampaignList> getList;

  factory GetFoodCampaignModel.fromJson(Map<String, dynamic> json) => GetFoodCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    getList: List<GetCampaignList>.from(json["getList"].map((x) => GetCampaignList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetCampaignList {
  GetCampaignList({
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
  String startDate;
  String endDate;
  String startTime;
  String endTime;
  String price;
  String discount;
  CampaignCategory category;
  CampaignSubCategory subCategory;
  List<CampaignAttributeValue> attribute;
  List<CampaignAddonValue> addon;
  String description;
  String foodImage;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory GetCampaignList.fromJson(Map<String, dynamic> json) => GetCampaignList(
    itemType: Type.fromJson(json["ItemType"] ?? {}),
    discountType: Type.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    zone: Zone.fromJson(json["Zone"] ?? {}),
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    startDate: json["StartDate"] ?? "",
    endDate: json["EndDate"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    price: json["Price"] ?? "",
    discount: json["Discount"] ?? "",
    category: CampaignCategory.fromJson(json["Category"] ?? {}),
    subCategory: CampaignSubCategory.fromJson(json["SubCategory"] ?? {}),
    attribute: List<CampaignAttributeValue>.from(json["Attribute"].map((x) => CampaignAttributeValue.fromJson(x)) ?? {}),
    addon: List<CampaignAddonValue>.from(json["Addon"].map((x) => CampaignAddonValue.fromJson(x)) ?? {}),
    description: json["Description"] ?? "",
    foodImage: json["FoodImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "ItemType": itemType,
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Title": title,
    "Zone": zone.toJson(),
    "Restaurant": restaurant.toJson(),
    "StartDate": startDate,
    "EndDate": endDate,
    "StartTime": startTime,
    "EndTime": endTime,
    "Price": price,
    "Discount": discount,
    "Category": category.toJson(),
    "SubCategory": subCategory.toJson(),
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "Description": description,
    "FoodImage": foodImage,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
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
    value: json["value"] ?? "",
    label: json["label"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class Zone {
  Zone({
    required this.id,
    required this.name,
    required this.coordinates,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String coordinates;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    coordinates: json["Coordinates"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Coordinates": coordinates,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
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
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? {}),
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

class CampaignCategory {
  CampaignCategory({
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

  factory CampaignCategory.fromJson(Map<String, dynamic> json) => CampaignCategory(
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

class CampaignSubCategory {
  CampaignSubCategory({
    required this.id,
    required this.category,
    required this.restaurant,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String category;
  String restaurant;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory CampaignSubCategory.fromJson(Map<String, dynamic> json) => CampaignSubCategory(
    id: json["_id"] ?? "",
    category: json["Category"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category,
    "Restaurant": restaurant,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class CampaignAttributeValue {
  CampaignAttributeValue({
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

  factory CampaignAttributeValue.fromJson(Map<String, dynamic> json) => CampaignAttributeValue(
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

class CampaignAddonValue {
  CampaignAddonValue({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory CampaignAddonValue.fromJson(Map<String, dynamic> json) => CampaignAddonValue(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant,
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

