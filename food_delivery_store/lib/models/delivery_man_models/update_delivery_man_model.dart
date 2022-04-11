// To parse this JSON data, do
//
//     final updateDeliveryManModel = updateDeliveryManModelFromJson(jsonString);

import 'dart:convert';

UpdateDeliveryManModel updateDeliveryManModelFromJson(String str) => UpdateDeliveryManModel.fromJson(json.decode(str));

String updateDeliveryManModelToJson(UpdateDeliveryManModel data) => json.encode(data.toJson());

class UpdateDeliveryManModel {
  UpdateDeliveryManModel({
    required this.status,
    required this.message,
    required this.updatedeliveryperson,
  });

  bool status;
  String message;
  Updatedeliveryperson updatedeliveryperson;

  factory UpdateDeliveryManModel.fromJson(Map<String, dynamic> json) => UpdateDeliveryManModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    updatedeliveryperson: Updatedeliveryperson.fromJson(json["updatedeliveryperson"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "updatedeliveryperson": updatedeliveryperson.toJson(),
  };
}

class Updatedeliveryperson {
  Updatedeliveryperson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.gender,
    required this.zone,
    required this.roleId,
    required this.restaurant,
    required this.address,
    required this.identityType,
    required this.identityNumber,
    required this.isSuspended,
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
  String zone;
  String roleId;
  String restaurant;
  String address;
  String identityType;
  String identityNumber;
  bool isSuspended;
  bool isActive;
  String email;
  String identityImage;
  String image;
  bool isVerified;
  int v;

  factory Updatedeliveryperson.fromJson(Map<String, dynamic> json) => Updatedeliveryperson(
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    phone: json["Phone"] ?? 0,
    password: json["Password"] ?? "",
    gender: json["Gender"] ?? "",
    zone: json["Zone"] ?? "",
    roleId: json["RoleId"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    address: json["Address"] ?? "",
    identityType: json["IdentityType"] ?? "",
    identityNumber: json["IdentityNumber"] ?? "",
    isSuspended: json["IsSuspended"] ?? false,
    isActive: json["IsActive"] ?? false,
    email: json["Email"] ?? "",
    identityImage: json["IdentityImage"] ?? "",
    image: json["Image"] ?? "",
    isVerified: json["IsVerified"] ?? false,
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "Zone": zone,
    "RoleId": roleId,
    "Restaurant": restaurant,
    "Address": address,
    "IdentityType": identityType,
    "IdentityNumber": identityNumber,
    "IsSuspended": isSuspended,
    "IsActive": isActive,
    "Email": email,
    "IdentityImage": identityImage,
    "Image": image,
    "IsVerified": isVerified,
    "__v": v,
  };
}
