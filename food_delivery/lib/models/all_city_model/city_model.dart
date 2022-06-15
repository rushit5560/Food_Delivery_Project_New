class AllCityModel {
  bool? status;
  String? message;
  List<GetList>? getList;

  AllCityModel({this.status, this.message, this.getList});

  AllCityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "";
    if (json['getList'] != null) {
      getList = <GetList>[];
      json['getList'].forEach((v) {
        getList!.add(new GetList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.getList != null) {
      data['getList'] = this.getList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetList {
  String? sId;
  String? cityName;
  CountryId? countryId;
  StateId? stateId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetList(
      {this.sId,
        this.cityName,
        this.countryId,
        this.stateId,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  GetList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    cityName = json['CityName'] ?? "";
    countryId = json['country_id'] != null
        ? new CountryId.fromJson(json['country_id'])
        : null;
    stateId = json['state_id'] != null
        ? new StateId.fromJson(json['state_id'])
        : null;
    isActive = json['IsActive'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['CityName'] = this.cityName;
    if (this.countryId != null) {
      data['country_id'] = this.countryId!.toJson();
    }
    if (this.stateId != null) {
      data['state_id'] = this.stateId!.toJson();
    }
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CountryId {
  String? sId;
  String? countryName;
  String? countryCode;
  String? flag;
  String? currency;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CountryId(
      {this.sId,
        this.countryName,
        this.countryCode,
        this.flag,
        this.currency,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CountryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    countryName = json['CountryName'] ?? "";
    countryCode = json['CountryCode'] ?? "";
    flag = json['Flag'] ?? "";
    currency = json['Currency'] ?? "";
    isActive = json['IsActive'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['CountryName'] = this.countryName;
    data['CountryCode'] = this.countryCode;
    data['Flag'] = this.flag;
    data['Currency'] = this.currency;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class StateId {
  String? sId;
  String? stateName;
  String? stateCode;
  String? countryId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? modifiedBy;

  StateId(
      {this.sId,
        this.stateName,
        this.stateCode,
        this.countryId,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.modifiedBy});

  StateId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    stateName = json['StateName'] ?? "";
    stateCode = json['StateCode'] ?? "";
    countryId = json['country_id'] ?? "";
    isActive = json['IsActive'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
    modifiedBy = json['ModifiedBy'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['StateName'] = this.stateName;
    data['StateCode'] = this.stateCode;
    data['country_id'] = this.countryId;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['ModifiedBy'] = this.modifiedBy;
    return data;
  }
}

// To parse this JSON data, do
//
//     final allCityModel = allCityModelFromJson(jsonString);

/*import 'dart:convert';

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
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    getList: List<GetList>.from(json["getList"].map((x) => GetList.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "getList": List<dynamic>.from(getList.map((x) => x.toJson())),
  };
}

class GetList {
  GetList({
     this.id,
     this.cityName,
     this.countryId,
     this.stateId,
     this.isActive,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  String ? id;
  String ? cityName;
  CountryId ? countryId;
  StateId ? stateId;
  bool ? isActive;
  String ? createdAt;
  String ? updatedAt;
  int ? v;

  factory GetList.fromJson(Map<String, dynamic> json) => GetList(
    id: json["_id"] ?? "",
    cityName: json["CityName"] ?? "",
    countryId: CountryId.fromJson(json["country_id"] ?? {}),
    stateId: StateId.fromJson(json["state_id"] ?? {}),
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
  String createdAt;
  String updatedAt;
  int v;

  factory CountryId.fromJson(Map<String, dynamic> json) => CountryId(
    id: json["_id"] ?? "",
    countryName: json["CountryName"] ?? "",
    countryCode: json["CountryCode"] ?? "",
    flag: json["Flag"] ?? "",
    currency: json["Currency"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"],
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
    "ModifiedBy": modifiedBy == null ? null : modifiedBy,
  };
}*/
