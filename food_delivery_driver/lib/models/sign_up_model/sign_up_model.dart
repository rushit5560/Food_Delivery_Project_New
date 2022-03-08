// To parse this JSON data, do
//
//     final signUpDriverModel = signUpDriverModelFromJson(jsonString);

import 'dart:convert';

SignUpDriverModel signUpDriverModelFromJson(String str) => SignUpDriverModel.fromJson(json.decode(str));

String signUpDriverModelToJson(SignUpDriverModel data) => json.encode(data.toJson());

class SignUpDriverModel {
  SignUpDriverModel({
    required this.status,
    required this.message,
    required this.deliveryPerson,
  });

  bool status;
  String message;
  DeliveryPerson deliveryPerson;

  factory SignUpDriverModel.fromJson(Map<String, dynamic> json) => SignUpDriverModel(
    status: json["status"],
    message: json["message"],
    deliveryPerson: DeliveryPerson.fromJson(json["DeliveryPerson"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "DeliveryPerson": deliveryPerson.toJson(),
  };
}

class DeliveryPerson {
  DeliveryPerson({
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
    required this.id,
    required this.v,
  });

  String firstName;
  String lastName;
  int phone;
  String password;
  String gender;
  String roleId;
  String restaurant;
  String address;
  bool isActive;
  String email;
  String identityImage;
  String image;
  bool isVerified;
  String id;
  int v;

  factory DeliveryPerson.fromJson(Map<String, dynamic> json) => DeliveryPerson(
    firstName: json["FirstName"],
    lastName: json["LastName"],
    phone: json["Phone"],
    password: json["Password"],
    gender: json["Gender"],
    roleId: json["RoleId"],
    restaurant: json["Restaurant"],
    address: json["Address"],
    isActive: json["IsActive"],
    email: json["Email"],
    identityImage: json["IdentityImage"],
    image: json["Image"],
    isVerified: json["IsVerified"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Password": password,
    "Gender": gender,
    "RoleId": roleId,
    "Restaurant": restaurant,
    "Address": address,
    "IsActive": isActive,
    "Email": email,
    "IdentityImage": identityImage,
    "Image": image,
    "IsVerified": isVerified,
    "_id": id,
    "__v": v,
  };
}
