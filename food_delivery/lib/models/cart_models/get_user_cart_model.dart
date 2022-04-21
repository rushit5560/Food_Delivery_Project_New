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
  CartDetail cart;
  List<CartItem> cartItem;

  factory GetUserCartModel.fromJson(Map<String, dynamic> json) => GetUserCartModel(
    status: json["status"] ?? false,
    cart: CartDetail.fromJson(json["Cart"] ?? {}),
    cartItem: List<CartItem>.from(json["CartItem"].map((x) => CartItem.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Cart": cart.toJson(),
    "CartItem": List<dynamic>.from(cartItem.map((x) => x.toJson())),
  };
}

class CartDetail {
  CartDetail({
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

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
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
    required this.campaignjoin,
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
  });

  List<String> campaignjoin;
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
  double rating;

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    campaignjoin: List<String>.from(json["campaignjoin"].map((x) => x) ?? ""),
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
    rating: json["Rating"].toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "campaignjoin": List<dynamic>.from(campaignjoin.map((x) => x)),
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
    required this.numberOfReviews,
    required this.rating,
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
  int numberOfReviews;
  double rating;
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
  List<Addon> attribute;
  List<Addon> addon;
  bool isFeatured;
  String description;
  String image;
  bool isApproved;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    productType: TType.fromJson(json["ProductType"] ?? {}),
    discountType: TType.fromJson(json["DiscountType"] ?? {}),
    numberOfReviews: json["NumberOfReviews"] ?? 0,
    rating: json["Rating"].toDouble() ?? 0.0,
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
    "ProductType": productType.toJson(),
    "DiscountType": discountType.toJson(),
    "NumberOfReviews": numberOfReviews,
    "Rating": rating,
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
    "Attribute": List<dynamic>.from(attribute.map((x) => x.toJson())),
    "Addon": List<dynamic>.from(addon.map((x) => x.toJson())),
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
