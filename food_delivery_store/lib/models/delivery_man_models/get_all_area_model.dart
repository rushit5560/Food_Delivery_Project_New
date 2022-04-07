import 'dart:convert';

GetAllAreaModel getAllAreaModelFromJson(String str) => GetAllAreaModel.fromJson(json.decode(str));

String getAllAreaModelToJson(GetAllAreaModel data) => json.encode(data.toJson());

class GetAllAreaModel {
  GetAllAreaModel({
    required this.status,
    required this.message,
    required this.getList,
  });

  bool status;
  String message;
  List<GetZoneList> getList;

  factory GetAllAreaModel.fromJson(Map<String, dynamic> json) => GetAllAreaModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    getList: List<GetZoneList>.from(json["getList"].map((x) => GetZoneList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetZoneList {
  GetZoneList({
    this.id,
    this.areaName,
    this.countryId,
    this.stateId,
    this.cityId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? areaName;
  CountryIdClass? countryId;
  StateId? stateId;
  CityId? cityId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  factory GetZoneList.fromJson(Map<String, dynamic> json) => GetZoneList(
    id: json["_id"] ?? "",
    areaName: json["AreaName"] ?? "",
    countryId: CountryIdClass.fromJson(json["country_id"] ?? {}),
    stateId: StateId.fromJson(json["state_id"] ?? {}),
    cityId: CityId.fromJson(json["city_id"] ?? {}),
    isActive: json["IsActive"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AreaName": areaName,
    "country_id": countryId!.toJson(),
    "state_id": stateId!.toJson(),
    "city_id": cityId!.toJson(),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class CityId {
  CityId({
    required this.id,
    required this.cityName,
    required this.countryId,
    required this.stateId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cityName;
  String countryId;
  String stateId;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory CityId.fromJson(Map<String, dynamic> json) => CityId(
    id: json["_id"] ?? "",
    cityName: json["CityName"] ?? "",
    countryId: json["country_id"] ?? "",
    stateId: json["state_id"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CityName": cityName,
    "country_id": countryId,
    "state_id": stateId,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class CountryIdClass {
  CountryIdClass({
    required this.id,
    required this.countryName,
    required this.countryCode,
    required this.flag,
    required this.currency,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String countryName;
  String countryCode;
  String flag;
  String currency;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory CountryIdClass.fromJson(Map<String, dynamic> json) => CountryIdClass(
    id: json["_id"] ?? "",
    countryName: json["CountryName"] ?? "",
    countryCode: json["CountryCode"] ?? "",
    flag: json["Flag"] ?? "",
    currency: json["Currency"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CountryName": countryName,
    "CountryCode": countryCode,
    "Flag": flag,
    "Currency": currency,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class StateId {
  StateId({
    required this.id,
    required this.stateName,
    required this.stateCode,
    required this.countryId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.modifiedBy,
  });

  String id;
  String stateName;
  String stateCode;
  String countryId;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String modifiedBy;

  factory StateId.fromJson(Map<String, dynamic> json) => StateId(
    id: json["_id"] ?? "",
    stateName: json["StateName"] ?? "",
    stateCode: json["StateCode"] ?? "",
    countryId: json["country_id"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    modifiedBy: json["ModifiedBy"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StateName": stateName,
    "StateCode": stateCode,
    "country_id": countryId,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "ModifiedBy": modifiedBy,
  };
}