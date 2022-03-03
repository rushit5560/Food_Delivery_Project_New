// To parse this JSON data, do
//
//     final allCityModel = allCityModelFromJson(jsonString);

import 'dart:convert';

AllCityModel allCityModelFromJson(String str) => AllCityModel.fromJson(json.decode(str));

String allCityModelToJson(AllCityModel data) => json.encode(data.toJson());

class AllCityModel {
  AllCityModel({
    required this.status,
    required this.message,
    required this.getList,
  });

  bool status;
  String message;
  List<GetList> getList;

  factory AllCityModel.fromJson(Map<String, dynamic> json) => AllCityModel(
    status: json["status"],
    message: json["message"],
    getList: List<GetList>.from(json["getList"].map((x) => GetList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetList {
  GetList({
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
  CountryId countryId;
  StateId stateId;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory GetList.fromJson(Map<String, dynamic> json) => GetList(
    id: json["_id"],
    cityName: json["CityName"],
    countryId: CountryId.fromJson(json["country_id"]),
    stateId: StateId.fromJson(json["state_id"]),
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CityName": cityName,
    "country_id": countryId.toJson(),
    "state_id": stateId.toJson(),
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class CountryId {
  CountryId({
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
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CountryId.fromJson(Map<String, dynamic> json) => CountryId(
    id: json["_id"],
    countryName: json["CountryName"],
    countryCode: json["CountryCode"],
    flag: json["Flag"],
    currency: json["Currency"],
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CountryName": countryName,
    "CountryCode": countryCode,
    "Flag": flag,
    "Currency": currency,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
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
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String modifiedBy;

  factory StateId.fromJson(Map<String, dynamic> json) => StateId(
    id: json["_id"],
    stateName: json["StateName"],
    stateCode: json["StateCode"],
    countryId: json["country_id"],
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    modifiedBy: json["ModifiedBy"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StateName": stateName,
    "StateCode": stateCode,
    "country_id": countryId,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "ModifiedBy": modifiedBy,
  };
}