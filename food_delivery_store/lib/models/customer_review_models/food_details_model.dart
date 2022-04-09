import 'dart:convert';

FoodDetailsModel foodDetailsModelFromJson(String str) => FoodDetailsModel.fromJson(json.decode(str));

String foodDetailsModelToJson(FoodDetailsModel data) => json.encode(data.toJson());

class FoodDetailsModel {
  FoodDetailsModel({
    required this.status,
    required this.product,
  });

  bool status;
  SingleProduct product;

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) => FoodDetailsModel(
    status: json["status"] ?? false,
    product: SingleProduct.fromJson(json["product"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "product": product.toJson(),
  };
}

class SingleProduct {
  SingleProduct({
    this.productType,
    this.discountType,
    this.id,
    this.category,
    this.subCategory,
    this.store,
    this.discount,
    this.productName,
    this.quantity,
    this.mrp,
    this.price,
    this.startTime,
    this.endTime,
    this.attribute,
    this.addon,
    this.isFeatured,
    this.description,
    this.image,
    this.isApproved,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  TType? productType;
  TType? discountType;
  String? id;
  Category? category;
  Category? subCategory;
  Store? store;
  int? discount;
  String? productName;
  int? quantity;
  int? mrp;
  int? price;
  String? startTime;
  String? endTime;
  List<Addon>? attribute;
  List<Addon>? addon;
  bool? isFeatured;
  String? description;
  String? image;
  bool? isApproved;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
    productType: TType.fromJson(json["ProductType"] ?? {}),
    discountType: TType.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    category: Category.fromJson(json["Category"] ?? {}),
    subCategory: Category.fromJson(json["SubCategory"] ?? {}),
    store: Store.fromJson(json["Store"] ?? {}),
    discount: json["Discount"] ?? 0,
    productName: json["ProductName"] ?? "",
    quantity: json["Quantity"] ?? 0,
    mrp: json["MRP"] ?? 0,
    price: json["Price"] ?? 0,
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x)) ?? {}),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? {}),
    isFeatured: json["IsFeatured"] ?? false,
    description: json["Description"] ?? "",
    image: json["Image"] ?? "",
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType!.toJson(),
    "DiscountType": discountType!.toJson(),
    "_id": id,
    "Category": category!.toJson(),
    "SubCategory": subCategory!.toJson(),
    "Store": store!.toJson(),
    "Discount": discount,
    "ProductName": productName,
    "Quantity": quantity,
    "MRP": mrp,
    "Price": price,
    "StartTime": startTime,
    "EndTime": endTime,
    "Attribute": List<dynamic>.from(attribute!.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon!.map((x) => x.toJson())),
    "IsFeatured": isFeatured,
    "Description": description,
    "Image": image,
    "IsApproved": isApproved,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  Category value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: Category.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}

class Category {
  Category({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
    required this.category,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  String image;
  String category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    image: json["Image"] ?? "",
    category: json["Category"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant,
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Image": image,
    "Category": category,
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
    value: json["value"] ?? "",
    label: json["label"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class Store {
  Store({
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

  factory Store.fromJson(Map<String, dynamic> json) => Store(
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
