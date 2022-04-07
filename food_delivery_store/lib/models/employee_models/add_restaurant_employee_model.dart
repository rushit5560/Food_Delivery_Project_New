import 'dart:convert';

AddRestaurantEmployeeModel addRestaurantEmployeeModelFromJson(String str) => AddRestaurantEmployeeModel.fromJson(json.decode(str));

String addRestaurantEmployeeModelToJson(AddRestaurantEmployeeModel data) => json.encode(data.toJson());

class AddRestaurantEmployeeModel {
  AddRestaurantEmployeeModel({
    required this.status,
    required this.message,
    required this.employee,
  });

  bool status;
  String message;
  Employee employee;

  factory AddRestaurantEmployeeModel.fromJson(Map<String, dynamic> json) => AddRestaurantEmployeeModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    employee: Employee.fromJson(json["employee"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "employee": employee.toJson(),
  };
}

class Employee {
  Employee({
    required this.firstName,
    required this.lastName,
    required this.zone,
    required this.employeeRole,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.restaurant,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String firstName;
  String lastName;
  String zone;
  String employeeRole;
  String phone;
  String email;
  String password;
  String image;
  String restaurant;
  bool isActive;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    zone: json["Zone"] ?? "",
    employeeRole: json["EmployeeRole"] ?? "",
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    image: json["Image"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "Zone": zone,
    "EmployeeRole": employeeRole,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Image": image,
    "Restaurant": restaurant,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
