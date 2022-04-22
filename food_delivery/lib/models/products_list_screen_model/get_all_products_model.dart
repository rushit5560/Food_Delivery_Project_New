
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
