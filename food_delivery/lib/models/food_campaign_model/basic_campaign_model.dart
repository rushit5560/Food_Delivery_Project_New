import 'dart:convert';

BasicCampaignModel basicCampaignModelFromJson(String str) => BasicCampaignModel.fromJson(json.decode(str));

String basicCampaignModelToJson(BasicCampaignModel data) => json.encode(data.toJson());

class BasicCampaignModel {
  BasicCampaignModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<BasicCampaignListElement> list;

  factory BasicCampaignModel.fromJson(Map<String, dynamic> json) => BasicCampaignModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<BasicCampaignListElement>.from(json["List"].map((x) => BasicCampaignListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class BasicCampaignListElement {
  BasicCampaignListElement({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.dailyStartTime,
    required this.dailyEndTime,
    required this.description,
    required this.campaignImage,
    required this.restaurant,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String startDate;
  String endDate;
  String dailyStartTime;
  String dailyEndTime;
  String description;
  String campaignImage;
  Restaurant restaurant;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory BasicCampaignListElement.fromJson(Map<String, dynamic> json) => BasicCampaignListElement(
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    startDate: json["StartDate"] ?? "",
    endDate: json["EndDate"] ?? "",
    dailyStartTime: json["DailyStartTime"] ?? "",
    dailyEndTime: json["DailyEndTime"] ?? "",
    description: json["Description"] ?? "",
    campaignImage: json["CampaignImage"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "StartDate": startDate,
    "EndDate": endDate,
    "DailyStartTime": dailyStartTime,
    "DailyEndTime": dailyEndTime,
    "Description": description,
    "CampaignImage": campaignImage,
    "Restaurant": restaurant.toJson(),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Restaurant {
  Restaurant({
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

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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
    rating: json["Rating"].toDouble(),
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
