// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.status,
    required this.deliveryperson,
  });

  bool status;
  Deliveryperson deliveryperson;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    deliveryperson: Deliveryperson.fromJson(json["deliveryperson"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "deliveryperson": deliveryperson.toJson(),
  };
}

class Deliveryperson {
  Deliveryperson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.gender,
    required this.roleId,
    required this.restaurant,
    required this.address,
    required this.isActive,
    required this.email,
    required this.identityImage,
    required this.image,
    required this.isVerified,
    required this.v,
  });

  String id;
  String firstName;
  String lastName;
  int phone;
  String password;
  String gender;
  RoleId roleId;
  String restaurant;
  String address;
  bool isActive;
  String email;
  String identityImage;
  String image;
  bool isVerified;
  int v;

  factory Deliveryperson.fromJson(Map<String, dynamic> json) => Deliveryperson(
    id: json["_id"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    phone: json["Phone"],
    password: json["Password"],
    gender: json["Gender"],
    roleId: RoleId.fromJson(json["RoleId"]),
    restaurant: json["Restaurant"],
    address: json["Address"],
    isActive: json["IsActive"],
    email: json["Email"],
    identityImage: json["IdentityImage"],
    image: json["Image"],
    isVerified: json["IsVerified"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "RoleId": roleId.toJson(),
    "Restaurant": restaurant,
    "Address": address,
    "IsActive": isActive,
    "Email": email,
    "IdentityImage": identityImage,
    "Image": image,
    "IsVerified": isVerified,
    "__v": v,
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
    id: json["_id"],
    roleName: json["RoleName"],
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
