import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    required this.status,
    required this.product,
  });

  bool status;
  Product product;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    status: json["status"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.productType,
    required this.discountType,
    required this.id,
    required this.category,
    required this.subCategory,
    required this.store,
    required this.productName,
    required this.quantity,
    required this.mrp,
    required this.price,
    required this.attribute,
    required this.addon,
    required this.isFeatured,
    required this.description,
    required this.isApproved,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  TType productType;
  TType discountType;
  String id;
  String category;
  String subCategory;
  Store store;
  String productName;
  int quantity;
  int mrp;
  int price;
  List<Addon> attribute;
  List<Addon> addon;
  bool isFeatured;
  String description;
  bool isApproved;
  bool isActive;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productType: TType.fromJson(json["ProductType"]),
    discountType: TType.fromJson(json["DiscountType"]),
    id: json["_id"] == null ? "" : json["_id"],
    category: json["Category"] == null ? "" : json["Category"],
    subCategory: json["SubCategory"] == null ? "" : json["SubCategory"],
    store: Store.fromJson(json["Store"]),
    productName: json["ProductName"] == null ? "" : json["ProductName"],
    quantity: json["Quantity"] == null ? 0 : json["Quantity"],
    mrp: json["MRP"] == null ? 0 : json["MRP"],
    price: json["Price"] == null ? 0 : json["Price"],
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))),
    isFeatured: json["IsFeatured"] == null ? false : json["IsFeatured"],
    description: json["Description"] == null ? "" : json["Description"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdBy: json["CreatedBy"] == null ? "" : json["CreatedBy"],
    updatedBy: json["UpdatedBy"] == null ? "" : json["UpdatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType.toJson(),
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Category": category,
    "SubCategory": subCategory,
    "Store": store.toJson(),
    "ProductName": productName,
    "Quantity": quantity,
    "MRP": mrp,
    "Price": price,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "IsFeatured": isFeatured,
    "Description": description,
    "IsApproved": isApproved,
    "IsActive": isActive,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  Value? value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: json["value"] == null ? null : Value.fromJson(json["value"]),
    label: json["label"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value!.toJson(),
    "label": label,
    "_id": id,
  };
}

class Value {
  Value({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String restaurant;
  String name;
  String price;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["_id"] == null ? "" : json["_id"],
    restaurant: json["Restaurant"] == null ? "" : json["Restaurant"],
    name: json["Name"] == null ? "" : json["Name"],
    price: json["Price"] == null ? "" : json["Price"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant,
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
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
    value: json["value"] == null ? "" : json["value"],
    label: json["label"] == null ? "" : json["label"],
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
    required this.tax,
    required this.address,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.zone,
    required this.latitude,
    required this.longitude,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.deliveryRange,
    required this.startTime,
    required this.endTime,
    required this.image,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String storeName;
  String tax;
  String address;
  String minDeliveryTime;
  String maxDeliveryTime;
  String zone;
  String latitude;
  String longitude;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  String startTime;
  String endTime;
  String image;
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["_id"] == null ? "" : json["_id"],
    storeName: json["StoreName"] == null ? "" : json["StoreName"],
    tax: json["Tax"] == null ? "" : json["Tax"],
    address: json["Address"] == null ? "" : json["Address"],
    minDeliveryTime: json["MinDeliveryTime"] == null ? "" : json["MinDeliveryTime"],
    maxDeliveryTime: json["MaxDeliveryTime"] == null ? "" : json["MaxDeliveryTime"],
    zone: json["Zone"] == null ? "" : json["Zone"],
    latitude: json["Latitude"] == null ? "" : json["Latitude"],
    longitude: json["Longitude"] == null ? "" : json["Longitude"],
    firstName: json["FirstName"] == null ? "" : json["FirstName"],
    lastName: json["LastName"] == null ? "" : json["LastName"],
    email: json["Email"] == null ? "" : json["Email"],
    password: json["Password"] == null ? "" : json["Password"],
    phone: json["Phone"] == null ? 0 : json["Phone"],
    deliveryRange: json["DeliveryRange"] == null ? "" : json["DeliveryRange"],
    startTime: json["StartTime"] == null ? "" : json["StartTime"],
    endTime: json["EndTime"] == null ? "" : json["EndTime"],
    image: json["Image"] == null ? "" : json["Image"],
    roleId: json["RoleId"] == null ? "" : json["RoleId"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    createdBy: json["CreatedBy"] == null ? "" : json["CreatedBy"],
    updatedBy: json["UpdatedBy"] == null ? "" : json["UpdatedBy"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "StoreName": storeName,
    "Tax": tax,
    "Address": address,
    "MinDeliveryTime": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime,
    "Zone": zone,
    "Latitude": latitude,
    "Longitude": longitude,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Password": password,
    "Phone": phone,
    "DeliveryRange": deliveryRange,
    "StartTime": startTime,
    "EndTime": endTime,
    "Image": image,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
