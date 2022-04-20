import 'dart:convert';

GetUserProfileModel getUserProfileModelFromJson(String str) => GetUserProfileModel.fromJson(json.decode(str));

String getUserProfileModelToJson(GetUserProfileModel data) => json.encode(data.toJson());

class GetUserProfileModel {
  GetUserProfileModel({
    required this.status,
    required this.user,
  });

  bool status;
  User user;

  factory GetUserProfileModel.fromJson(Map<String, dynamic> json) => GetUserProfileModel(
    status: json["status"] ?? false,
    user: User.fromJson(json["user"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user.toJson(),
  };
}

class User {
  User({
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
  CityId cityId;
  AreaId areaId;
  String gender;
  String photo;
  bool isActive;
  RoleId roleId;
  bool isVerified;
  String createdAt;
  String updatedAt;
  int v;
  String lastLogin;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] ?? "",
    userName: json["UserName"] ?? "",
    fullName: json["FullName"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    address: json["Address"] ?? "",
    cityId: CityId.fromJson(json["CityId"] ?? {}),
    areaId: AreaId.fromJson(json["AreaId"] ?? {}),
    gender: json["Gender"] ?? "",
    photo: json["Photo"] ?? "",
    isActive: json["IsActive"] ?? false,
    roleId: RoleId.fromJson(json["RoleId"] ?? {}),
    isVerified: json["IsVerified"] ?? false,
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
    "CityId": cityId.toJson(),
    "AreaId": areaId.toJson(),
    "Gender": gender,
    "Photo": photo,
    "IsActive": isActive,
    "RoleId": roleId.toJson(),
    "IsVerified": isVerified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "LastLogin": lastLogin,
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

class AreaId {
  AreaId({
    required this.id,
    required this.areaName,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String areaName;
  String countryId;
  String stateId;
  String cityId;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory AreaId.fromJson(Map<String, dynamic> json) => AreaId(
    id: json["_id"] ?? "",
    areaName: json["AreaName"] ?? "",
    countryId: json["country_id"] ?? "",
    stateId: json["state_id"] ?? "",
    cityId: json["city_id"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AreaName": areaName,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class RoleId {
  RoleId({
    required this.id,
    required this.areaName,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String areaName;
  String countryId;
  String stateId;
  String cityId;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
    id: json["_id"] ?? "",
    areaName: json["AreaName"] ?? "",
    countryId: json["country_id"] ?? "",
    stateId: json["state_id"] ?? "",
    cityId: json["city_id"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AreaName": areaName,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
