import 'dart:convert';

SubCategoryWiseProductsModel subCategoryWiseProductsModelFromJson(String str) => SubCategoryWiseProductsModel.fromJson(json.decode(str));

String subCategoryWiseProductsModelToJson(SubCategoryWiseProductsModel data) => json.encode(data.toJson());

class SubCategoryWiseProductsModel {
  SubCategoryWiseProductsModel({
    required this.status,
    required this.food,
  });

  bool status;
  List<Food> food;

  factory SubCategoryWiseProductsModel.fromJson(Map<String, dynamic> json) => SubCategoryWiseProductsModel(
    status: json["status"] ?? false,
    food: List<Food>.from(json["food"].map((x) => Food.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "food": List<dynamic>.from(food.map((x) => x.toJson())),
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
    required this.discount,
    required this.productName,
    required this.quantity,
    required this.mrp,
    required this.price,
    required this.isFeatured,
    required this.description,
    required this.numberOfReviews,
    required this.rating,
    required this.isApproved,
    required this.isActive,
    required this.attribute,
    required this.addon,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.endTime,
    required this.image,
    required this.startTime,
  });

  TType productType;
  TType discountType;
  String id;
  ProductCategory category;
  ProductSubCategory subCategory;
  ProductStore store;
  int discount;
  String productName;
  int quantity;
  int mrp;
  int price;
  bool isFeatured;
  String description;
  int numberOfReviews;
  double rating;
  bool isApproved;
  bool isActive;
  List<ProductAttribute> attribute;
  List<ProductAddon> addon;
  int v;
  String createdAt;
  String updatedAt;
  String endTime;
  String image;
  String startTime;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    productType: TType.fromJson(json["ProductType"] ?? {}),
    discountType: TType.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    category: ProductCategory.fromJson(json["Category"] ?? {}),
    subCategory: ProductSubCategory.fromJson(json["SubCategory"] ?? {}),
    store: ProductStore.fromJson(json["Store"] ?? {}),
    discount: json["Discount"] ?? 0,
    productName: json["ProductName"] ?? "",
    quantity: json["Quantity"] ?? 0,
    mrp: json["MRP"] ?? 0,
    price: json["Price"] ?? 0,
    isFeatured: json["IsFeatured"] ?? false,
    description: json["Description"] ?? "",
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toDouble(),
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    attribute: List<ProductAttribute>.from(json["Attribute"].map((x) => ProductAttribute.fromJson(x)) ?? {}),
    addon: List<ProductAddon>.from(json["Addon"].map((x) => ProductAddon.fromJson(x)) ?? {}),
    v: json["__v"] ?? 0,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    endTime: json["EndTime"] ?? "",
    image: json["Image"] ?? "",
    startTime: json["StartTime"] ?? "",
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
    "IsFeatured": isFeatured,
    "Description": description,
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
    "IsApproved": isApproved,
    "IsActive": isActive,
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "EndTime": endTime,
    "Image": image,
    "StartTime": startTime,
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

class ProductCategory {
  ProductCategory({
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
  String createdAt;
  String updatedAt;
  int v;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Restaurant": restaurant,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class ProductSubCategory {
  ProductSubCategory({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String category;
  String name;
  String image;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ProductSubCategory.fromJson(Map<String, dynamic> json) => ProductSubCategory(
    id: json["_id"] ?? "",
    category: json["Category"] ?? "",
    name: json["Name"] ?? "",
    image: json["Image"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Category": category,
    "Name": name,
    "Image": image,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class ProductStore {
  ProductStore({
    required this.numberOfReviews,
    required this.rating,
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
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.coverImage,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.maxDeliveryTime,
    required this.minDeliveryTime,
    required this.tax,
    required this.zone,
    required this.campaignjoin,
  });

  int numberOfReviews;
  int rating;
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
  String roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  String approvedOn;
  String createdAt;
  String updatedAt;
  int v;
  String coverImage;
  String image;
  String latitude;
  String longitude;
  String maxDeliveryTime;
  String minDeliveryTime;
  String tax;
  String zone;
  List<String> campaignjoin;

  factory ProductStore.fromJson(Map<String, dynamic> json) => ProductStore(
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"] ?? 0,
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
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    coverImage: json["CoverImage"] ?? "",
    image: json["Image"] ?? "",
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    tax: json["Tax"] ?? "",
    zone: json["Zone"] ?? "",
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "CoverImage": coverImage,
    "Image": image,
    "Latitude": latitude,
    "Longitude": longitude,
    "MaxDeliveryTime": maxDeliveryTime,
    "MinDeliveryTime": minDeliveryTime,
    "Tax": tax,
    "Zone": zone,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
  };
}

class ProductAttribute {
  ProductAttribute({
    required this.value,
    required this.label,
    required this.id,
  });

  ProductAttributeValue value;
  String label;
  String id;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
    value: ProductAttributeValue.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}
class ProductAttributeValue {
  ProductAttributeValue({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ProductAttributeValue.fromJson(Map<String, dynamic> json) => ProductAttributeValue(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}


class ProductAddon {
  ProductAddon({
    required this.value,
    required this.label,
    required this.id,
  });

  Value value;
  String label;
  String id;

  factory ProductAddon.fromJson(Map<String, dynamic> json) => ProductAddon(
    value: Value.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
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
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  Restaurant restaurant;
  String name;
  String price;
  bool isActive;
  int v;
  String createdAt;
  String updatedAt;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["_id"] ?? "",
    restaurant: Restaurant.fromJson(json["Restaurant"] ?? {}),
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    v: json["__v"] ?? 0,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Restaurant": restaurant.toJson(),
    "Name": name,
    "Price": price,
    "IsActive": isActive,
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
class Restaurant {
  Restaurant({
    required this.numberOfReviews,
    required this.rating,
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
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.createdBy,
    required this.updatedBy,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.coverImage,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.maxDeliveryTime,
    required this.minDeliveryTime,
    required this.tax,
    required this.zone,
    required this.campaignjoin,
  });

  int numberOfReviews;
  int rating;
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
  RoleId roleId;
  bool isActive;
  bool isApproved;
  String createdBy;
  String updatedBy;
  String approvedOn;
  String createdAt;
  String updatedAt;
  int v;
  String coverImage;
  String image;
  String latitude;
  String longitude;
  String maxDeliveryTime;
  String minDeliveryTime;
  String tax;
  String zone;
  List<String> campaignjoin;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"] ?? 0,
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
    roleId: RoleId.fromJson(json["RoleId"] ?? {}),
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    createdBy: json["CreatedBy"] ?? "",
    updatedBy: json["UpdatedBy"] ?? "",
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    coverImage: json["CoverImage"] ?? "",
    image: json["Image"] ?? "",
    latitude: json["Latitude"] ?? "",
    longitude: json["Longitude"] ?? "",
    maxDeliveryTime: json["MaxDeliveryTime"] ?? "",
    minDeliveryTime: json["MinDeliveryTime"] ?? "",
    tax: json["Tax"] ?? "",
    zone: json["Zone"] ?? "",
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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
    "RoleId": roleId.toJson(),
    "IsActive": isActive,
    "IsApproved": isApproved,
    "CreatedBy": createdBy,
    "UpdatedBy": updatedBy,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "CoverImage": coverImage,
    "Image": image,
    "Latitude": latitude,
    "Longitude": longitude,
    "MaxDeliveryTime": maxDeliveryTime,
    "MinDeliveryTime": minDeliveryTime,
    "Tax": tax,
    "Zone": zone,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
  };
}
class RoleId {
  RoleId({
    required this.id,
    required this.roleName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.rolestatus,
  });

  String id;
  String roleName;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  int rolestatus;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
    id: json["_id"] ?? "",
    roleName: json["RoleName"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    rolestatus: json["Rolestatus"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "RoleName": roleName,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "Rolestatus": rolestatus,
  };
}
