import 'dart:convert';

UpdateCategoryModel updateCategoryModelFromJson(String str) => UpdateCategoryModel.fromJson(json.decode(str));

String updateCategoryModelToJson(UpdateCategoryModel data) => json.encode(data.toJson());

class UpdateCategoryModel {
  UpdateCategoryModel({
    required this.status,
    required this.message,
    required this.updatedCategory,
  });

  bool status;
  String message;
  UpdatedCategory updatedCategory;

  factory UpdateCategoryModel.fromJson(Map<String, dynamic> json) => UpdateCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    updatedCategory: UpdatedCategory.fromJson(json["updatedCategory"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "updatedCategory": updatedCategory.toJson(),
  };
}

class UpdatedCategory {
  UpdatedCategory({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String restaurant;
  String image;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UpdatedCategory.fromJson(Map<String, dynamic> json) => UpdatedCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
