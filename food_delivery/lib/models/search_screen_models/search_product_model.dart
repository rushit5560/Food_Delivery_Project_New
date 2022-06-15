import 'dart:convert';

SearchProductsModel searchProductsModelFromJson(String str) => SearchProductsModel.fromJson(json.decode(str));

String searchProductsModelToJson(SearchProductsModel data) => json.encode(data.toJson());

class SearchProductsModel {
  SearchProductsModel({
    required this.status,
    required this.food,
  });

  bool status;
  List<SingleFoodItem> food;

  factory SearchProductsModel.fromJson(Map<String, dynamic> json) => SearchProductsModel(
    status: json["status"] ?? false,
    food: List<SingleFoodItem>.from(json["food"].map((x) => SingleFoodItem.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "food": List<dynamic>.from(food.map((x) => x.toJson())),
  };
}

class SingleFoodItem {
  SingleFoodItem({
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
  Category category;
  SubCategory subCategory;
  Store store;
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
  List<Attribute> attribute;
  List<Addon> addon;
  int v;
  String createdAt;
  String updatedAt;
  String endTime;
  String image;
  String startTime;

  factory SingleFoodItem.fromJson(Map<String, dynamic> json) => SingleFoodItem(
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
    isFeatured: json["IsFeatured"] ?? false,
    description: json["Description"] ?? "",
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: double.parse(json["Rating"].toString()),
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    attribute: List<Attribute>.from(json["Attribute"].map((x) => Attribute.fromJson(x)) ?? {}),
    addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? {}),
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

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class SubCategory {
  SubCategory({
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

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
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
    required this.numberOfReviews,
    required this.rating,
    required this.campaignjoin,
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
  int numberOfReviews;
  int rating;
  List<String> campaignjoin;

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
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"]/*.toDouble()*/ ?? 0,
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
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
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
  };
}


class Attribute {
  Attribute({
    required this.value,
    required this.label,
    required this.id,
  });

  AttributeValue value;
  String label;
  String id;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    value: AttributeValue.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}
class AttributeValue {
  AttributeValue({
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

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
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

class Addon {
  Addon({
    required this.value,
    required this.label,
    required this.id,
  });

  AddonValue value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: AddonValue.fromJson(json["value"] ?? {}),
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value.toJson(),
    "label": label,
    "_id": id,
  };
}
class AddonValue {
  AddonValue({
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
  String createdAt;
  String updatedAt;
  int v;

  factory AddonValue.fromJson(Map<String, dynamic> json) => AddonValue(
    id: json["_id"] ?? "",
    restaurant: json["Restaurant"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
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
  };
}




