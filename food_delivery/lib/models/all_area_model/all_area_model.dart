// To parse this JSON data, do
//
//     final cityWiseAreaModel = cityWiseAreaModelFromJson(jsonString);

import 'dart:convert';

CityWiseAreaModel cityWiseAreaModelFromJson(String str) => CityWiseAreaModel.fromJson(json.decode(str));

String cityWiseAreaModelToJson(CityWiseAreaModel data) => json.encode(data.toJson());

class CityWiseAreaModel {
  CityWiseAreaModel({
    required this.status,
    required this.area,
  });

  bool status;
  List<Area> area;

  factory CityWiseAreaModel.fromJson(Map<String, dynamic> json) => CityWiseAreaModel(
    status: json["status"],
    area: List<Area>.from(json["area"].map((x) => Area.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "area": List<dynamic>.from(area.map((x) => x.toJson())),
  };
}

class Area {
  Area({
    required this.id,
    required this.areaName,
    required this.cityInfo,
    required this.stateInfo,
    required this.countryInfo,
  });

  String id;
  String areaName;
  CityInfo cityInfo;
  StateInfo stateInfo;
  CountryInfo countryInfo;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["_id"],
    areaName: json["AreaName"],
    cityInfo: CityInfo.fromJson(json["city_info"]),
    stateInfo: StateInfo.fromJson(json["state_info"]),
    countryInfo: CountryInfo.fromJson(json["country_info"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AreaName": areaName,
    "city_info": cityInfo.toJson(),
    "state_info": stateInfo.toJson(),
    "country_info": countryInfo.toJson(),
  };
}

class CityInfo {
  CityInfo({
    required this.id,
    required this.cityName,
  });

  String id;
  String cityName;

  factory CityInfo.fromJson(Map<String, dynamic> json) => CityInfo(
    id: json["_id"],
    cityName: json["CityName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CityName": cityName,
  };
}

class CountryInfo {
  CountryInfo({
    required this.id,
    required this.countryName,
  });

  String id;
  String countryName;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"],
    countryName: json["CountryName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CountryName": countryName,
  };
}

class StateInfo {
  StateInfo({
    required this.id,
    required this.stateName,
  });

  String id;
  String stateName;

  factory StateInfo.fromJson(Map<String, dynamic> json) => StateInfo(
    id: json["_id"],
    stateName: json["StateName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StateName": stateName,
  };
}