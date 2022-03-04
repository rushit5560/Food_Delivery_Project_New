import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
  UpdateUserModel({
    required this.status,
    required this.message,
    required this.updatedUser,
  });

  bool status;
  String message;
  UpdatedUser updatedUser;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    updatedUser: UpdatedUser.fromJson(json["updatedUser"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "updatedUser": updatedUser.toJson(),
  };
}

class UpdatedUser {
  UpdatedUser({
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
  String cityId;
  String areaId;
  String gender;
  String photo;
  bool isActive;
  String roleId;
  bool isVerified;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DateTime lastLogin;

  factory UpdatedUser.fromJson(Map<String, dynamic> json) => UpdatedUser(
    reseLink: json["reseLink"] ?? "",
    id: json["_id"] ?? "",
    userName: json["UserName"] ?? "",
    fullName: json["FullName"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    address: json["Address"] ?? "",
    cityId: json["CityId"] ?? "",
    areaId: json["AreaId"] ?? "",
    gender: json["Gender"] ?? "",
    photo: json["Photo"] ?? "",
    isActive: json["IsActive"] ?? false,
    roleId: json["RoleId"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    lastLogin: DateTime.parse(json["LastLogin"] ?? DateTime.now()),
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
    "CityId": cityId,
    "AreaId": areaId,
    "Gender": gender,
    "Photo": photo,
    "IsActive": isActive,
    "RoleId": roleId,
    "IsVerified": isVerified,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "LastLogin": lastLogin.toIso8601String(),
  };
}
