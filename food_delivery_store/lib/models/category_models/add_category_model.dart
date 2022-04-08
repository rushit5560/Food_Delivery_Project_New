import 'dart:convert';

AddCategoryModel addCategoryModelFromJson(String str) => AddCategoryModel.fromJson(json.decode(str));

String addCategoryModelToJson(AddCategoryModel data) => json.encode(data.toJson());

class AddCategoryModel {
  AddCategoryModel({
    required this.status,
    required this.message,
    required this.category,
  });

  bool status;
  String message;
  Category category;

  factory AddCategoryModel.fromJson(Map<String, dynamic> json) => AddCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    category: Category.fromJson(json["category"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "category": category.toJson(),
  };
}

class Category {
  Category({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String name;
  String restaurant;
  String image;
  bool isActive;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["Name"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    id: json["_id"] ?? "",
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Restaurant": restaurant,
    "Image": image,
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
