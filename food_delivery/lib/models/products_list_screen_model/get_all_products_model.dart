/*
import 'dart:convert';

GetAllProductsModel getAllProductsModelFromJson(String str) => GetAllProductsModel.fromJson(json.decode(str));

String getAllProductsModelToJson(GetAllProductsModel data) => json.encode(data.toJson());

class GetAllProductsModel {
  GetAllProductsModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ListElement> list;

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) => GetAllProductsModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    required this.productType,
    required this.discountType,
    required this.id,
    required this.category,
    required this.subCategory,
    required this.store,
    required this.discount,
    required this.productName,
    required this.quantity,
    required this.mrp,
    required this.price,
    required this.attribute,
    required this.addon,
    required this.isFeatured,
    required this.description,
    required this.image,
    required this.isApproved,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  TType productType;
  TType discountType;
  String id;
  Category category;
  SubCategory subCategory;
  Store store;
  int discount;
  String productName;
  int quantity;
  int mrp;
  int price;
  List<Addon> attribute;
  List<Addon> addon;
  bool isFeatured;
  String description;
  String image;
  bool isApproved;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    productType: TType.fromJson(json["ProductType"] ?? {}),
    discountType: TType.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    category: Category.fromJson(json["Category"] ?? {}),
    subCategory: SubCategory.fromJson(json["SubCategory"] ?? {}),
    store: Store.fromJson(json["Store"] ?? {}),
    discount: json["Discount"] ?? 0,
    productName: json["ProductName"] ?? "",
    quantity: json["Quantity"] ?? 0,
    mrp: json["MRP"] ?? 0,
    price: json["Price"] ?? 0,
    attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x)) ?? {}),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? {}),
    isFeatured: json["IsFeatured"] ?? false,
    description: json["Description"] ?? "",
    image: json["Image"] ?? "",
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType.toJson(),
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Category": category.toJson(),
    "SubCategory": subCategory.toJson(),
    "Store": store.toJson(),
    "Discount": discount,
    "ProductName": productName,
    "Quantity": quantity,
    "MRP": mrp,
    "Price": price,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "IsFeatured": isFeatured,
    "Description": description,
    "Image": image,
    "IsApproved": isApproved,
    "IsActive": isActive,
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
  });

  String id;
  Restaurant restaurant;
  String name;
  String price;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    image: json["Image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant == null ? null : restaurant.toJson(),
    "Name": name,
    "Price": price == null ? null : price,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Image": image == null ? null : image,
  };
}

class Restaurant {
  Restaurant({
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
  SubCategory roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  DateTime approvedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    tax: json["Tax"] ?? "",
    address: json["Address"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    zone: json["Zone"] ?? "",
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ?? "",
    roleId: SubCategory.fromJson(json["RoleId"] ?? {}),
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: DateTime.parse(json["ApprovedOn"] ?? DateTime.now()),
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
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
    "RoleId": roleId.toJson(),
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

class SubCategory {
  SubCategory({
    required this.id,
    required this.roleName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.name,
  });

  String id;
  String roleName;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String name;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["_id"] ?? "",
    roleName: json["RoleName"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
    name: json["Name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "RoleName": roleName == null ? null : roleName,
    "IsActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "Name": name == null ? null : name,
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
  String address;
  String firstName;
  String lastName;
  String email;
  String password;
  int phone;
  String deliveryRange;
  DateTime startTime;
  DateTime endTime;
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
    id: json["_id"] ?? "",
    storeName: json["StoreName"] ?? "",
    address: json["Address"] ?? "",
    firstName: json["FirstName"] ?? "",
    lastName: json["LastName"] ?? "",
    email: json["Email"] ?? "",
    password: json["Password"] ?? "",
    phone: json["Phone"] ?? 0,
    deliveryRange: json["DeliveryRange"] ?? "",
    startTime: DateTime.parse(json["StartTime"] ?? DateTime.now()),
    endTime: DateTime.parse(json["EndTime"] ?? DateTime.now()),
    image: json["Image"] ?? "",
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: DateTime.parse(json["ApprovedOn"] ?? DateTime.now()),
    createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    v: json["__v"] ?? 0,
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
    "StartTime": startTime.toIso8601String(),
    "EndTime": endTime.toIso8601String(),
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
*/


class GetAllProductsModel {
  bool? status;
  String? message;
  List<GetAllProductList>? list;

  GetAllProductsModel({this.status, this.message, this.list});

  GetAllProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['List'] != null) {
      list = <GetAllProductList>[];
      json['List'].forEach((v) {
        list!.add(new GetAllProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.list != null) {
      data['List'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllProductList {
  ProductType? productType;
  ProductType? discountType;
  String? sId;
  Category? category;
  Store? store;
  int? discount;
  String? productName;
  int? quantity;
  int? mRP;
  int? price;
  List<Attribute>? attribute;
  List<Addon>? addon;
  bool? isFeatured;
  String? description;
  String? image;
  bool? isApproved;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Value? subCategory;

  GetAllProductList(
      {this.productType,
        this.discountType,
        this.sId,
        this.category,
        this.store,
        this.discount,
        this.productName,
        this.quantity,
        this.mRP,
        this.price,
        this.attribute,
        this.addon,
        this.isFeatured,
        this.description,
        this.image,
        this.isApproved,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.subCategory});

  GetAllProductList.fromJson(Map<String, dynamic> json) {
    productType = json['ProductType'] != null
        ? new ProductType.fromJson(json['ProductType'])
        : null;
    discountType = json['DiscountType'] != null
        ? new ProductType.fromJson(json['DiscountType'])
        : null;
    sId = json['_id'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
    store = json['Store'] != null ? new Store.fromJson(json['Store']) : null;
    discount = json['Discount'];
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
    image = json['Image'];
    isApproved = json['IsApproved'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    subCategory = json['SubCategory'] != null
        ? new Value.fromJson(json['SubCategory'])
        : null;
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
    if (this.category != null) {
      data['Category'] = this.category!.toJson();
    }
    if (this.store != null) {
      data['Store'] = this.store!.toJson();
    }
    data['Discount'] = this.discount;
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
    data['Image'] = this.image;
    data['IsApproved'] = this.isApproved;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.subCategory != null) {
      data['SubCategory'] = this.subCategory!.toJson();
    }
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

class Category {
  String? sId;
  String? name;
  String? image;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Category(
      {this.sId,
        this.name,
        this.image,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    image = json['Image'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Image'] = this.image;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
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
  Value? value;
  String? label;
  String? sId;

  Attribute({this.value, this.label, this.sId});

  Attribute.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
    label = json['label'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['label'] = this.label;
    data['_id'] = this.sId;
    return data;
  }
}

class Value {
  String? sId;
  String? name;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Value(
      {this.sId,
        this.name,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Value.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductValue {
  String? sId;
  Restaurant? restaurant;
  String? name;
  String? price;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductValue(
      {this.sId,
        this.restaurant,
        this.name,
        this.price,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ProductValue.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    restaurant = json['Restaurant'] != null
        ? new Restaurant.fromJson(json['Restaurant'])
        : null;
    name = json['Name'];
    price = json['Price'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.restaurant != null) {
      data['Restaurant'] = this.restaurant!.toJson();
    }
    data['Name'] = this.name;
    data['Price'] = this.price;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Restaurant {
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
  RoleId? roleId;
  bool? isActive;
  bool? isApproved;
  String? createdBy;
  String? updatedBy;
  String? approvedOn;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Restaurant(
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

  Restaurant.fromJson(Map<String, dynamic> json) {
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
    roleId =
    json['RoleId'] != null ? new RoleId.fromJson(json['RoleId']) : null;
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
    if (this.roleId != null) {
      data['RoleId'] = this.roleId!.toJson();
    }
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

class RoleId {
  String? sId;
  String? roleName;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RoleId(
      {this.sId,
        this.roleName,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  RoleId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roleName = json['RoleName'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['RoleName'] = this.roleName;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
