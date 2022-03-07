// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

class AddProductModel {
  AddProductModel({
    required this.status,
    required this.message,
    required this.product,
  });

  bool status;
  String message;
  Product product;

  factory AddProductModel.fromJson(Map<String, dynamic> json) => AddProductModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "" : json["message"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toString().isEmpty ? false : status,
    "message": message.isEmpty ? "" : message,
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.category,
    required this.subCategory,
    required this.store,
    required this.discount,
    required this.productType,
    required this.productName,
    required this.quantity,
    required this.mrp,
    required this.price,
    required this.discountType,
    required this.attribute,
    required this.addon,
    required this.isFeatured,
    required this.description,
    required this.image,
    required this.isApproved,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String category;
  String subCategory;
  String store;
  int discount;
  TType productType;
  String productName;
  int quantity;
  int mrp;
  int price;
  TType discountType;
  List<Addon> attribute;
  List<Addon> addon;
  bool isFeatured;
  String description;
  String image;
  bool isApproved;
  bool isActive;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    category: json["Category"] == null ? "" : json["Category"],
    subCategory: json["SubCategory"] == null ? "" : json["SubCategory"],
    store: json["Store"] == null ? "" : json["Store"],
    discount: json["Discount"] == null ? 0 : json["Discount"],
    productType: TType.fromJson(json["ProductType"]),
    productName: json["ProductName"] == null ? "" : json["ProductName"],
    quantity: json["Quantity"] == null ? 0 : json["Quantity"],
    mrp: json["MRP"] == null ? 0 : json["MRP"],
    price: json["Price"] == null ? 0 : json["Price"],
    discountType: TType.fromJson(json["DiscountType"]),
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))),
    isFeatured: json["IsFeatured"] == null ? false : json["IsFeatured"],
    description: json["Description"] == null ? "": json["Description"],
    image: json["Image"] == null ? "" : json["Image"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    id: json["_id"]== null ? "": json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "Category": category.isEmpty ? "" : category,
    "SubCategory": subCategory.isEmpty ? "" : subCategory,
    "Store": store.isEmpty ? "": store,
    "Discount": discount.toString().isEmpty ? 0 : discount,
    "ProductType": productType.toJson(),
    "ProductName": productName.isEmpty ? "": productName,
    "Quantity": quantity.toString().isEmpty ? 0 : quantity,
    "MRP": mrp.toString().isEmpty ? 0 : mrp,
    "Price": price.toString().isEmpty ? 0 : price,
    "DiscountType": discountType.toJson(),
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "IsFeatured": isFeatured.toString().isEmpty ? false : isFeatured,
    "Description": description.isEmpty ? "": description,
    "Image": image.isEmpty ? "" : image,
    "IsApproved": isApproved.toString().isEmpty ? false : isApproved,
    "IsActive": isActive.toString().isEmpty ? false : isActive,
    "_id": id.isEmpty ? null : id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v.toString().isEmpty ? 0 : v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  String value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: json["value"] == null ? "" : json["value"],
    label: json["label"] == null ? "": json["label"],
    id: json["_id"] == null ? "": json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value.isEmpty ? "": value,
    "label": label.isEmpty ? "" : label,
    "_id": id.isEmpty ? "": id,
  };
}

class TType {
  TType({
    required this.value,
    required this.label,
  });

  String value;
  String label;

  factory TType.fromJson(Map<String, dynamic> json) => TType(
    value: json["value"] == null ? "": json["value"],
    label: json["label"] == null ? "": json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value.isEmpty ? "": value,
    "label": label.isEmpty ? "": label,
  };
}
