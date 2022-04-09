// To parse this JSON data, do
//
//     final updateEmployeeModel = updateEmployeeModelFromJson(jsonString);

import 'dart:convert';

UpdateEmployeeModel updateEmployeeModelFromJson(String str) => UpdateEmployeeModel.fromJson(json.decode(str));

String updateEmployeeModelToJson(UpdateEmployeeModel data) => json.encode(data.toJson());

class UpdateEmployeeModel {
  UpdateEmployeeModel({
    required this.status,
    required this.message,
    required this.updatedEmployee,
  });

  bool status;
  String message;
  UpdatedEmployee updatedEmployee;

  factory UpdateEmployeeModel.fromJson(Map<String, dynamic> json) => UpdateEmployeeModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    updatedEmployee: UpdatedEmployee.fromJson(json["updatedEmployee"] ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "updatedEmployee": updatedEmployee.toJson(),
  };
}

class UpdatedEmployee {
  UpdatedEmployee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.employeeRole,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.restaurant,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String firstName;
  String lastName;
  String employeeRole;
  String phone;
  String email;
  String password;
  String image;
  String restaurant;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory UpdatedEmployee.fromJson(Map<String, dynamic> json) => UpdatedEmployee(
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    employeeRole: json["EmployeeRole"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    image: json["Image"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "EmployeeRole": employeeRole,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Image": image,
    "Restaurant": restaurant,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
