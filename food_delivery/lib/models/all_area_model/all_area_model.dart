// To parse this JSON data, do
//
//     final cityWiseAreaModel = cityWiseAreaModelFromJson(jsonString);

import 'dart:convert';

CityWiseAreaModel cityWiseAreaModelFromJson(String str) => CityWiseAreaModel.fromJson(json.decode(str));

String cityWiseAreaModelToJson(CityWiseAreaModel data) => json.encode(data.toJson());

class CityWiseAreaModel {
  CityWiseAreaModel({
    this.status,
    this.message,
    this.getList,
  });

  bool? status;
  String? message;
  List<GetAreaList>? getList;

  factory CityWiseAreaModel.fromJson(Map<String, dynamic> json) => CityWiseAreaModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    getList: List<GetAreaList>.from(json["getList"].map((x) => GetAreaList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList!.map((x) => x.toJson())),
  };
}

class GetAreaList {
  GetAreaList({
    this.id,
    this.areaName,
    this.cityInfo,
    this.stateInfo,
    this.countryInfo,
  });

  String? id;
  String? areaName;
  CityInfo? cityInfo;
  StateInfo? stateInfo;
  CountryInfo? countryInfo;

  factory GetAreaList.fromJson(Map<String, dynamic> json) => GetAreaList(
    id: json["_id"] ?? "",
    areaName: json["AreaName"]  ?? "",
    cityInfo: CityInfo.fromJson(json["city_info"] ?? {}),
    stateInfo: StateInfo.fromJson(json["state_info"] ?? {}),
    countryInfo: CountryInfo.fromJson(json["country_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AreaName": areaName,
    "city_info": cityInfo!.toJson(),
    "state_info": stateInfo!.toJson(),
    "country_info": countryInfo!.toJson(),
  };
}

class CityInfo {
  CityInfo({
    this.id,
    this.cityName,
  });

  String? id;
  String? cityName;

  factory CityInfo.fromJson(Map<String, dynamic> json) => CityInfo(
    id: json["_id"] ?? "",
    cityName: json["CityName"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CityName": cityName,
  };
}

class CountryInfo {
  CountryInfo({
    this.id,
    this.countryName,
  });

  String? id;
  String? countryName;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"] ?? "",
    countryName: json["CountryName"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CountryName": countryName,
  };
}

class StateInfo {
  StateInfo({
    this.id,
    this.stateName,
  });

  String? id;
  String? stateName;

  factory StateInfo.fromJson(Map<String, dynamic> json) => StateInfo(
    id: json["_id"] ?? "",
    stateName: json["StateName"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StateName": stateName,
  };
}
