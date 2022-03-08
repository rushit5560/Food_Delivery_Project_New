/*
// To parse this JSON data, do
//
//     final getStoreProductModel = getStoreProductModelFromJson(jsonString);

import 'dart:convert';

GetStoreProductModel getStoreProductModelFromJson(String str) => GetStoreProductModel.fromJson(json.decode(str));

String getStoreProductModelToJson(GetStoreProductModel data) => json.encode(data.toJson());

class GetStoreProductModel {
  GetStoreProductModel({
    required this.status,
    required this.food,
  });

  bool status;
  List<Food> food;

  factory GetStoreProductModel.fromJson(Map<String, dynamic> json) => GetStoreProductModel(
    status: json["status"] == null ? false : json["status"],
    food: List<Food>.from(json["food"].map((x) => Food.fromJson(x))).isEmpty ? [] : List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toString().isEmpty ? false : status,
    "food": List<dynamic>.from(food.map((x) => x.toJson())).length == 0 ? []: List<dynamic>.from(food.map((x) => x.toJson())),
  };
}

class Food {
  Food({
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

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    productType: TType.fromJson(json["ProductType"]),
    discountType: TType.fromJson(json["DiscountType"]),
    id: json["_id"] == null ? "" : json["_id"],
    category: json["Category"] == null ? "" : json["Category"],
    subCategory: json["SubCategory"] == null ? "": json["SubCategory"],
    store: Store.fromJson(json["Store"]),
    productName: json["ProductName"] == null ? "": json["ProductName"],
    quantity: json["Quantity"] == null ? 0 : json["Quantity"],
    mrp: json["MRP"] == null ? 0 : json["MRP"],
    price: json["Price"] == null ? 0 : json["Price"],
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))).isEmpty ? [] : List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x))),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))).isEmpty ? []: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x))),
    isFeatured: json["IsFeatured"] == null ? false : json["IsFeatured"],
    description: json["Description"]== null ? "" : json["Description"],
    isApproved: json["IsApproved"] == null ? false : json["IsApproved"],
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    createdBy: json["CreatedBy"] == null ? "" : json["CreatedBy"],
    updatedBy: json["UpdatedBy"] == null ? "" : json["UpdatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType.toJson().isEmpty ? [] : productType.toJson(),
    "DiscountType": discountType.toJson().isEmpty ? [] : discountType.toJson(),
    "_id": id.isEmpty ? "" : id,
    "Category": category.isEmpty ? "" : category,
    "SubCategory": subCategory.isEmpty ? "" : subCategory,
    "Store": store.toJson(),
    "ProductName": productName.isEmpty ? "" : productName,
    "Quantity": quantity.toString().isEmpty ? 0 : quantity,
    "MRP": mrp.toString().isEmpty ? 0 : mrp,
    "Price": price.toString().isEmpty ? 0 : price,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())).length == 0 ? []: List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())).length == 0 ? [] : List<dynamic>.from(addon.map((x) => x.toJson())),
    "IsFeatured": isFeatured.toString().isEmpty ? false : isFeatured,
    "Description": description.isEmpty ? "" : description,
    "IsApproved": isApproved.toString().isEmpty ? false : isApproved,
    "IsActive": isActive.toString().isEmpty ? false : isActive,
    "CreatedBy": createdBy.isEmpty ? "" : createdBy,
    "UpdatedBy": updatedBy.isEmpty ? "" : updatedBy,
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
    label: json["label"] == null ? "" : json["label"],
    id: json["_id"] == null ? "" : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value.isEmpty ? "" : value,
    "label": label.isEmpty ? "" : label,
    "_id": id.isEmpty ? "" : id,
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
    "value": value.isEmpty ? "" : value,
    "label": label.isEmpty ? "": label,
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
    storeName: json["StoreName"] == null ? "": json["StoreName"],
    tax: json["Tax"] == null ? "" : json["Tax"],
    address: json["Address"]== null ? "" : json["Address"],
    minDeliveryTime: json["MinDeliveryTime"] == null ? "" : json["MinDeliveryTime"],
    maxDeliveryTime: json["MaxDeliveryTime"]== null ? "" : json["MaxDeliveryTime"],
    zone: json["Zone"] == null ? "" : json["Zone"],
    latitude: json["Latitude"] == null ? "": json["Latitude"],
    longitude: json["Longitude"] == null ? "": json["Longitude"],
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
    updatedBy: json["UpdatedBy"] == null ? "": json["UpdatedBy"],
    approvedOn: DateTime.parse(json["ApprovedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.isEmpty ? "" : id,
    "StoreName": storeName.isEmpty ? "" : storeName,
    "Tax": tax.isEmpty ? "": tax,
    "Address": address.isEmpty ? "": address,
    "MinDeliveryTime": minDeliveryTime.isEmpty ? "": minDeliveryTime,
    "MaxDeliveryTime": maxDeliveryTime.isEmpty ? "": maxDeliveryTime,
    "Zone": zone.isEmpty ? "": zone,
    "Latitude": latitude.isEmpty ? "": latitude,
    "Longitude": longitude.isEmpty ? "": longitude,
    "FirstName": firstName.isEmpty ? "": firstName,
    "LastName": lastName.isEmpty ? "": lastName,
    "Email": email.isEmpty ? "": email,
    "Password": password.isEmpty ? "": password,
    "Phone": phone.toString().isEmpty ? 0 : phone,
    "DeliveryRange": deliveryRange.isEmpty ? "": deliveryRange,
    "StartTime": startTime.isEmpty ? "": startTime,
    "EndTime": endTime.isEmpty ? "": endTime,
    "Image": image.isEmpty ? "": image,
    "RoleId": roleId.isEmpty ? "": roleId,
    "IsActive": isActive.toString().isEmpty ? false : isActive,
    "IsApproved": isApproved.toString().isEmpty ? false : isApproved,
    "CreatedBy": createdBy.isEmpty ? "": createdBy,
    "UpdatedBy": updatedBy.isEmpty ? "" : updatedBy,
    "ApprovedOn": approvedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v.toString().isEmpty ? 0 : v,
  };
}
*/

class GetStoreProductModel {
  bool? status;
  List<Food>? food;

  GetStoreProductModel({this.status, this.food});

  GetStoreProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['food'] != null) {
      food = <Food>[];
      json['food'].forEach((v) {
        food!.add(new Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.food != null) {
      data['food'] = this.food!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
  ProductType? productType;
  ProductType? discountType;
  String? sId;
  String? category;
  String? subCategory;
  Store? store;
  String? productName;
  int? quantity;
  int? mRP;
  int? price;
  List<Attribute>? attribute;
  List<Addon>? addon;
  bool? isFeatured;
  String? description;
  bool? isApproved;
  bool? isActive;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? discount;
  String? startTime;
  String? endTime;
  String? image;

  Food(
      {this.productType,
        this.discountType,
        this.sId,
        this.category,
        this.subCategory,
        this.store,
        this.productName,
        this.quantity,
        this.mRP,
        this.price,
        this.attribute,
        this.addon,
        this.isFeatured,
        this.description,
        this.isApproved,
        this.isActive,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.discount,
        this.startTime,
        this.endTime,
        this.image});

  Food.fromJson(Map<String, dynamic> json) {
    productType = json['ProductType'] != null
        ? new ProductType.fromJson(json['ProductType'])
        : null;
    discountType = json['DiscountType'] != null
        ? new ProductType.fromJson(json['DiscountType'])
        : null;
    sId = json['_id'];
    category = json['Category'];
    subCategory = json['SubCategory'];
    store = json['Store'] != null ? new Store.fromJson(json['Store']) : null;
    productName = json['ProductName'];
    quantity = json['Quantity'];
    mRP = json['MRP'];
    price = json['Price'];
    if (json['Attribute'] != null) {
      attribute = <Attribute>[];
      json['Attribute'].forEach((v) {
        attribute!.add(new Attribute.fromJson(v));
      });
    }
    if (json['Addon'] != null) {
      addon = <Addon>[];
      json['Addon'].forEach((v) {
        addon!.add(new Addon.fromJson(v));
      });
    }
    isFeatured = json['IsFeatured'];
    description = json['Description'];
    isApproved = json['IsApproved'];
    isActive = json['IsActive'];
    createdBy = json['CreatedBy'];
    updatedBy = json['UpdatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    discount = json['Discount'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productType != null) {
      data['ProductType'] = this.productType!.toJson();
    }
    if (this.discountType != null) {
      data['DiscountType'] = this.discountType!.toJson();
    }
    data['_id'] = this.sId;
    data['Category'] = this.category;
    data['SubCategory'] = this.subCategory;
    if (this.store != null) {
      data['Store'] = this.store!.toJson();
    }
    data['ProductName'] = this.productName;
    data['Quantity'] = this.quantity;
    data['MRP'] = this.mRP;
    data['Price'] = this.price;
    if (this.attribute != null) {
      data['Attribute'] = this.attribute!.map((v) => v.toJson()).toList();
    }
    if (this.addon != null) {
      data['Addon'] = this.addon!.map((v) => v.toJson()).toList();
    }
    data['IsFeatured'] = this.isFeatured;
    data['Description'] = this.description;
    data['IsApproved'] = this.isApproved;
    data['IsActive'] = this.isActive;
    data['CreatedBy'] = this.createdBy;
    data['UpdatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['Discount'] = this.discount;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['Image'] = this.image;
    return data;
  }
}

class ProductType {
  String? value;
  String? label;

  ProductType({this.value, this.label});

  ProductType.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Store {
  String? sId;
  String? storeName;
  String? tax;
  String? address;
  String? minDeliveryTime;
  String? maxDeliveryTime;
  String? zone;
  String? latitude;
  String? longitude;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? phone;
  String? deliveryRange;
  String? startTime;
  String? endTime;
  String? image;
  String? roleId;
  bool? isActive;
  bool? isApproved;
  String? createdBy;
  String? updatedBy;
  String? approvedOn;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Store(
      {this.sId,
        this.storeName,
        this.tax,
        this.address,
        this.minDeliveryTime,
        this.maxDeliveryTime,
        this.zone,
        this.latitude,
        this.longitude,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.phone,
        this.deliveryRange,
        this.startTime,
        this.endTime,
        this.image,
        this.roleId,
        this.isActive,
        this.isApproved,
        this.createdBy,
        this.updatedBy,
        this.approvedOn,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Store.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    storeName = json['StoreName'];
    tax = json['Tax'];
    address = json['Address'];
    minDeliveryTime = json['MinDeliveryTime'];
    maxDeliveryTime = json['MaxDeliveryTime'];
    zone = json['Zone'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    password = json['Password'];
    phone = json['Phone'];
    deliveryRange = json['DeliveryRange'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    image = json['Image'];
    roleId = json['RoleId'];
    isActive = json['IsActive'];
    isApproved = json['IsApproved'];
    createdBy = json['CreatedBy'];
    updatedBy = json['UpdatedBy'];
    approvedOn = json['ApprovedOn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['StoreName'] = this.storeName;
    data['Tax'] = this.tax;
    data['Address'] = this.address;
    data['MinDeliveryTime'] = this.minDeliveryTime;
    data['MaxDeliveryTime'] = this.maxDeliveryTime;
    data['Zone'] = this.zone;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Phone'] = this.phone;
    data['DeliveryRange'] = this.deliveryRange;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['Image'] = this.image;
    data['RoleId'] = this.roleId;
    data['IsActive'] = this.isActive;
    data['IsApproved'] = this.isApproved;
    data['CreatedBy'] = this.createdBy;
    data['UpdatedBy'] = this.updatedBy;
    data['ApprovedOn'] = this.approvedOn;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Attribute {
  String? value;
  String? label;
  String? sId;

  Attribute({this.value, this.label, this.sId});

  Attribute.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    data['_id'] = this.sId;
    return data;
  }
}

class Addon {
  String? value;
  String? label;
  String? sId;

  Addon({this.value, this.label, this.sId});

  Addon.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    data['_id'] = this.sId;
    return data;
  }
}
