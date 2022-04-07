// To parse this JSON data, do
//
//     final getAllRestaurantEmployeeModel = getAllRestaurantEmployeeModelFromJson(jsonString);

import 'dart:convert';

GetAllRestaurantEmployeeModel getAllRestaurantEmployeeModelFromJson(String str) => GetAllRestaurantEmployeeModel.fromJson(json.decode(str));

String getAllRestaurantEmployeeModelToJson(GetAllRestaurantEmployeeModel data) => json.encode(data.toJson());

class GetAllRestaurantEmployeeModel {
  GetAllRestaurantEmployeeModel({
    required this.status,
    required this.employee,
  });

  bool status;
  List<Employee> employee;

  factory GetAllRestaurantEmployeeModel.fromJson(Map<String, dynamic> json) => GetAllRestaurantEmployeeModel(
    status: json["status"] ?? false,
    employee: List<Employee>.from(json["employee"].map((x) => Employee.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "employee": List<dynamic>.from(employee.map((x) => x.toJson())),
  };
}

class Employee {
  Employee({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String firstName;
  String lastName;
  String zone;
  EmployeeRole employeeRole;
  String phone;
  String email;
  String password;
  String image;
  Restaurant restaurant;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["_id"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    zone: json["Zone"] ?? "",
    employeeRole: EmployeeRole.fromJson(json["EmployeeRole"] ?? {}),
    phone: json["Phone"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    image: json["Image"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Zone": zone,
    "EmployeeRole": employeeRole.toJson(),
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Image": image,
    "Restaurant": restaurant.toJson(),
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class EmployeeRole {
  EmployeeRole({
    required this.permission,
    required this.id,
    required this.name,
    required this.store,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Map<String, bool> permission;
  String id;
  String name;
  String store;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory EmployeeRole.fromJson(Map<String, dynamic> json) => EmployeeRole(
    permission: Map.from(json["Permission"] ?? {}).map((k, v) => MapEntry<String, bool>(k, v)),
    id: json["_id"] ?? "",
    name: json["Name"] ?? "Role",
    store: json["Store"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Permission": Map.from(permission).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "_id": id,
    "Name": name,
    "Store": store,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Restaurant {
  Restaurant({
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
    required this.coverImage,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.latitude,
    required this.longitude,
    required this.maxDeliveryTime,
    required this.minDeliveryTime,
    required this.tax,
    required this.zone,
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
  String startTime;
  String endTime;
  String image;
  String coverImage;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  String approvedOn;
  String createdAt;
  String updatedAt;
  int v;
  String latitude;
  String longitude;
  String maxDeliveryTime;
  String minDeliveryTime;
  String tax;
  String zone;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    address: json["Address"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ?? "",
    coverImage: json["CoverImage"] ?? "",
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    tax: json["Tax"] ?? "",
    zone: json["Zone"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Address": address,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "Image": image,
    "CoverImage": coverImage,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Latitude": latitude,
    "Longitude": longitude,
    "MaxDeliveryTime": maxDeliveryTime,
    "MinDeliveryTime": minDeliveryTime,
    "Tax": tax,
    "Zone": zone,
  };
}
