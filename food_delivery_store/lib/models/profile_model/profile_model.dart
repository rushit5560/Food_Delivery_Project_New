// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.status,
    required this.user,
  });

  bool status;
  User user;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"] == null ? "" : json["status"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toString().isEmpty ? "" : status,
    "user": user.toJson(),
  };
}

class User {
  User({
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
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String storeName;
  String address;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  DateTime startTime;
  DateTime endTime;
  String image;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] == null ? "" : json["_id"],
    storeName: json["StoreName"] == null ? "": json["StoreName"],
    address: json["Address"] == null ? "": json["Address"],
    firstName: json["FirstName"] == null ? "" : json["FirstName"],
    lastName: json["LastName"] == null ? "": json["LastName"],
    email: json["Email"] == null ? "": json["Email"],
    password: json["Password"] == null ? "" : json["Password"],
    phone: json["Phone"] == null ? 0 : json["Phone"],
    deliveryRange: json["DeliveryRange"] == null ? "": json["DeliveryRange"],
    startTime: DateTime.parse(json["StartTime"]),
    endTime: DateTime.parse(json["EndTime"]),
    image: json["Image"] == null ? "": json["Image"],
    roleId: json["RoleId"] == null ? "": json["RoleId"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    createdBy: json["CreatedBy"] == null ? "": json["CreatedBy"],
    updatedBy: json["UpdatedBy"] == null ? "": json["UpdatedBy"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.isEmpty ? "": id,
    "StoreName": storeName.isEmpty ? "": storeName,
    "Address": address.isEmpty ? "": address,
    "FirstName": firstName.isEmpty ? "": firstName,
    "LastName": lastName.isEmpty ? "": lastName,
    "Email": email.isEmpty ? "": email,
    "Password": password.isEmpty ? "": password,
    "Phone": phone.toString().isEmpty ? 0 : phone,
    "DeliveryRange": deliveryRange.isEmpty ? "": deliveryRange,
    "StartTime": startTime.toIso8601String(),
    "EndTime": endTime.toIso8601String(),
    "Image": image.isEmpty ? "": image,
    "RoleId": roleId.isEmpty ? "": roleId,
    "IsActive": isActive.toString().isEmpty ? false : isActive,
    "IsApproved": isApproved.toString().isEmpty ? false : isApproved,
    "CreatedBy": createdBy.isEmpty ? "": createdBy,
    "UpdatedBy": updatedBy.isEmpty ? "": updatedBy,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v.toString().isEmpty ? 0: v
  };
}
