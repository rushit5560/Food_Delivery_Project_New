import 'dart:convert';

AddDeliveryManModel addDeliveryManModelFromJson(String str) => AddDeliveryManModel.fromJson(json.decode(str));

String addDeliveryManModelToJson(AddDeliveryManModel data) => json.encode(data.toJson());

class AddDeliveryManModel {
  AddDeliveryManModel({
    required this.status,
    required this.message,
    required this.deliveryPerson,
  });

  bool status;
  String message;
  DeliveryPerson deliveryPerson;

  factory AddDeliveryManModel.fromJson(Map<String, dynamic> json) => AddDeliveryManModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    deliveryPerson: DeliveryPerson.fromJson(json["DeliveryPerson"] ?? {}),
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
    required this.id,
    required this.v,
  });

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
  String id;
  int v;

  factory DeliveryPerson.fromJson(Map<String, dynamic> json) => DeliveryPerson(
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
    isVerified: json["IsVerified"] ?? true,
    id: json["_id"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
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
    "_id": id,
    "__v": v,
  };
}
