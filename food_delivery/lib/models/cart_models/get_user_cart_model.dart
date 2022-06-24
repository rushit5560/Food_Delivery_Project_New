// To parse this JSON data, do
//
//     final getUserCartModel = getUserCartModelFromJson(jsonString);

import 'dart:convert';

GetUserCartModel getUserCartModelFromJson(String str) => GetUserCartModel.fromJson(json.decode(str));

String getUserCartModelToJson(GetUserCartModel data) => json.encode(data.toJson());

class GetUserCartModel {
  GetUserCartModel({
    required this.status,
    required this.cart,
    required this.cartItem,
  });

  bool status;
  Cart cart;
  List<CartItem> cartItem;

  factory GetUserCartModel.fromJson(Map<String, dynamic> json) => GetUserCartModel(
    status: json["status"] ?? false,
    cart: Cart.fromJson(json["Cart"] ?? {}),
    cartItem: List<CartItem>.from(json["CartItem"].map((x) => CartItem.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Cart": cart.toJson(),
    "CartItem": List<dynamic>.from(cartItem.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.quantity,
    required this.subTotal,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  RestaurantId restaurantId;
  int quantity;
  int subTotal;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["_id"] ?? "",
    userId: json["UserId"] ?? "",
    restaurantId: RestaurantId.fromJson(json["RestaurantId"] ?? {}),
    quantity: json["Quantity"] ?? 0,
    subTotal: json["SubTotal"] ?? 0,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "UserId": userId,
    "RestaurantId": restaurantId.toJson(),
    "Quantity": quantity,
    "SubTotal": subTotal,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class RestaurantId {
  RestaurantId({
    required this.numberOfReviews,
    required this.rating,
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
    required this.coverImage,
    required this.roleId,
    required this.isActive,
    required this.isApproved,
    required this.approvedOn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.campaignjoin,
  });

  int numberOfReviews;
  String rating;
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
  String coverImage;
  String roleId;
  bool isActive;
  bool isApproved;
  String approvedOn;
  String createdAt;
  String updatedAt;
  int v;
  List<dynamic> campaignjoin;

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toString(),
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
    coverImage: json["CoverImage"] ?? "",
    roleId: json["RoleId"] ?? "",
    isActive: json["IsActive"] ?? false,
    isApproved: json["IsApproved"] ?? false,
    approvedOn: json["ApprovedOn"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
    campaignjoin: List<dynamic>.from(json["campaignjoin"].map((x) => x) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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
    "CoverImage": coverImage,
    "RoleId": roleId,
    "IsActive": isActive,
    "IsApproved": isApproved,
    "ApprovedOn": approvedOn,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
  };
}

class CartItem {
  CartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.productQuantity,
    required this.productPrice,
    required this.itemTotalPrice,
    required this.addonTotalPrice,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cartId;
  ProductId productId;
  int productQuantity;
  int productPrice;
  int itemTotalPrice;
  int addonTotalPrice;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["_id"] ?? "",
    cartId: json["CartId"] ?? "",
    productId: ProductId.fromJson(json["ProductId"] ?? {}),
    productQuantity: json["ProductQuantity"] ?? 0,
    productPrice: json["ProductPrice"] ?? 0,
    itemTotalPrice: json["ItemTotalPrice"] ?? 0,
    addonTotalPrice: json["AddonTotalPrice"] ?? 0,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CartId": cartId,
    "ProductId": productId.toJson(),
    "ProductQuantity": productQuantity,
    "ProductPrice": productPrice,
    "ItemTotalPrice": itemTotalPrice,
    "AddonTotalPrice": addonTotalPrice,
    "IsActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class ProductId {
  ProductId({
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
    required this.startTime,
    required this.endTime,
    //required this.attribute,
    //required this.addon,
    required this.isFeatured,
    required this.description,
    required this.numberOfReviews,
    required this.rating,
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
  String category;
  String subCategory;
  String store;
  int discount;
  String productName;
  int quantity;
  int mrp;
  int price;
  String startTime;
  String endTime;
  //List<Addon> attribute;
  //List<Addon> addon;
  bool isFeatured;
  String description;
  int numberOfReviews;
  String rating;
  String image;
  bool isApproved;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    productType: TType.fromJson(json["ProductType"] ?? {}),
    discountType: TType.fromJson(json["DiscountType"] ?? {}),
    id: json["_id"] ?? "",
    category: json["Category"] ?? "",
    subCategory: json["SubCategory"] ?? "",
    store: json["Store"] ?? "",
    discount: json["Discount"] ?? 0,
    productName: json["ProductName"] ?? "",
    quantity: json["Quantity"] ?? 0,
    mrp: json["MRP"] ?? 0,
    price: json["Price"] ?? 0,
    startTime: json["StartTime"] ?? "",
    endTime: json["EndTime"] ?? "",
    //attribute: List<Addon>.from(json["Attribute"].map((x) => Addon.fromJson(x)) ?? {}),
    //addon: List<Addon>.from(json["Addon"].map((x) => Addon.fromJson(x)) ?? {}),
    isFeatured: json["IsFeatured"] ?? false,
    description: json["Description"] ?? "",
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toString(),
    image: json["Image"] ?? "",
    isApproved: json["IsApproved"] ?? false,
    isActive: json["IsActive"] ?? false,
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "ProductType": productType.toJson(),
    "DiscountType": discountType.toJson(),
    "_id": id,
    "Category": category,
    "SubCategory": subCategory,
    "Store": store,
    "Discount": discount,
    "ProductName": productName,
    "Quantity": quantity,
    "MRP": mrp,
    "Price": price,
    "StartTime": startTime,
    "EndTime": endTime,
    //"Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    //"Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
    "IsFeatured": isFeatured,
    "Description": description,
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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

  String value;
  String label;
  String id;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    value: json["value"] ?? "",
    label: json["label"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
    "_id": id,
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
