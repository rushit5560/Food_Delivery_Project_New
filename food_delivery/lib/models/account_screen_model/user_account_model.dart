/*
import 'dart:convert';

UserAccountModel userAccountModelFromJson(String str) => UserAccountModel.fromJson(json.decode(str));

String userAccountModelToJson(UserAccountModel data) => json.encode(data.toJson());

class UserAccountModel {
  UserAccountModel({
    required this.status,
    required this.user,
  });

  bool status;
  User user;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) => UserAccountModel(
    status: json["status"] == null ? false : json["status"],
    user: User.fromJson(json["user"]),
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
    required this.isActive,
    required this.roleId,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.photo,
  });

  String id;
  String userName;
  String fullName;
  String phone;
  String email;
  String password;
  String address;
  Id cityId;
  Id areaId;
  String gender;
  bool isActive;
  RoleId roleId;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String photo;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] == null ? "" : json["_id"],
    userName: json["UserName"] == null ? "" : json["UserName"],
    fullName: json["FullName"] == null ? "" : json["FullName"],
    phone: json["Phone"] == null ? "" : json["Phone"],
    email: json["Email"] == null ? "" : json["Email"],
    password: json["Password"] == null ? "" : json["Password"],
    address: json["Address"] == null ? "" : json["Address"],
    cityId: Id.fromJson(json["CityId"]),
    areaId: Id.fromJson(json["AreaId"]),
    gender: json["Gender"] == null ? "" : json["Gender"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    roleId: RoleId.fromJson(json["RoleId"]),
    isVerified: json["IsVerified"] == null ? false : json["IsVerified"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
    photo: json["Photo"] == null ? "" : json["Photo"],
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
    "IsActive": isActive,
    "RoleId": roleId.toJson(),
    "IsVerified": isVerified,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Photo": photo,
  };
}

class Id {
  Id({
    required this.id,
    required this.areaName,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.cityName,
  });

  String id;
  String areaName;
  String countryId;
  String stateId;
  String cityId;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String cityName;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    id: json["_id"] == null ? "" : json["_id"],
    areaName: json["AreaName"] == null ? "" : json["AreaName"],
    countryId: json["country_id"] == null ? "" : json["country_id"],
    stateId: json["state_id"] == null ? "" : json["state_id"],
    cityId: json["city_id"] == null ? "" : json["city_id"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
    cityName: json["CityName"] == null ? "" : json["CityName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AreaName": areaName == null ? null : areaName,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId == null ? null : cityId,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "CityName": cityName == null ? null : cityName,
  };
}

class RoleId {
  RoleId({
    required this.id,
    required this.roleName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String roleName;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
    id: json["_id"] == null ? "" : json["_id"],
    roleName: json["RoleName"] == null ? "" : json["RoleName"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "RoleName": roleName,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
*/

// To parse this JSON data, do
//
//     final userAccountModel = userAccountModelFromJson(jsonString);

import 'dart:convert';

UserAccountModel userAccountModelFromJson(String str) => UserAccountModel.fromJson(json.decode(str));

String userAccountModelToJson(UserAccountModel data) => json.encode(data.toJson());

class UserAccountModel {
  UserAccountModel({
    required this.status,
    required this.user,
  });

  bool status;
  User user;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) => UserAccountModel(
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
    required this.reseLink,
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
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastLogin,
  });

  String reseLink;
  String id;
  String userName;
  String fullName;
  String phone;
  String email;
  String password;
  String address;
  Id cityId;
  Id areaId;
  String gender;
  String photo;
  bool isActive;
  RoleId roleId;
  bool isVerified;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  int v;
  String lastLogin;

  factory User.fromJson(Map<String, dynamic> json) => User(
    reseLink: json["reseLink"] ?? "",
    id: json["_id"] ?? "",
    userName: json["UserName"] ?? "",
    fullName: json["FullName"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    address: json["Address"] ?? "",
    cityId: Id.fromJson(json["CityId"] ?? {}),
    areaId: Id.fromJson(json["AreaId"] ?? {}),
    gender: json["Gender"] ?? "",
    photo: json["Photo"] ?? "",
    isActive: json["IsActive"] ?? "",
    roleId: RoleId.fromJson(json["RoleId"] ?? {}),
    isVerified: json["IsVerified"] ?? "",
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    lastLogin: json["LastLogin"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "reseLink": reseLink,
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
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "LastLogin": lastLogin,
  };
}

class Id {
  Id({
    required this.id,
    required this.areaName,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.cityName,
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
  String cityName;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    id: json["_id"] ?? "",
    areaName: json["AreaName"] ?? "",
    countryId: json["country_id"] ?? "",
    stateId: json["state_id"] ?? "",
    cityId: json["city_id"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    cityName: json["CityName"] ?? "",
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
    "CityName": cityName,
  };
}

class RoleId {
  RoleId({
    required this.rolestatus,
    required this.id,
    required this.roleName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  int rolestatus;
  String id;
  String roleName;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
    rolestatus: json["Rolestatus"] ?? 0,
    id: json["_id"] ?? "",
    roleName: json["RoleName"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Rolestatus": rolestatus,
    "_id": id,
    "RoleName": roleName,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
