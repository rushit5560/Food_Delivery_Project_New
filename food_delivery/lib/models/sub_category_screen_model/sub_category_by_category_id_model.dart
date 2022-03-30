import 'dart:convert';

SubCategoryByCatIdModel subCategoryByCatIdModelFromJson(String str) => SubCategoryByCatIdModel.fromJson(json.decode(str));

String subCategoryByCatIdModelToJson(SubCategoryByCatIdModel data) => json.encode(data.toJson());

class SubCategoryByCatIdModel {
  SubCategoryByCatIdModel({
    required this.status,
    required this.subcategory,
  });

  bool status;
  List<SubCategory> subcategory;

  factory SubCategoryByCatIdModel.fromJson(Map<String, dynamic> json) => SubCategoryByCatIdModel(
    status: json["status"] ?? false,
    subcategory: List<SubCategory>.from(json["subcategory"].map((x) => SubCategory.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.category,
    required this.restaurant,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
  });

  String id;
  Category category;
  String restaurant;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String image;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["_id"] ?? "",
    category: Category.fromJson(json["Category"] ?? {}),
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    image: json["Image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category.toJson(),
    "Restaurant": restaurant,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Image": image,
  };
}

class Category {
  Category({
    required this.sId,
    required this.name,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
    required this.restaurant,
  });

  String sId;
  String name;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int iV;
  String restaurant;



  factory Category.fromJson(Map<String, dynamic> json) => Category(
    sId: json['_id'] ?? "",
    name: json['Name'] ?? "",
    image: json['Image'] ?? "",
    isActive: json['IsActive'] ?? false,
    createdAt:  json['createdAt'] ?? "",
    updatedAt: json['updatedAt'] ?? "",
    iV: json['__v'] ?? 0,
    restaurant: json['Restaurant'] ?? "",
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Image'] = this.image;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['Restaurant'] = this.restaurant;
    return data;
  }
}