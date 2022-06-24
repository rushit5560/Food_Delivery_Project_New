class GetFoodReviewModel {
  bool? status;
  String? message;
  List<List1>? list;

  GetFoodReviewModel({this.status, this.message, this.list});

  GetFoodReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "";
    if (json['List'] != null) {
      list = <List1>[];
      json['List'].forEach((v) {
        list!.add(new List1.fromJson(v));
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

class List1 {
  String? sId;
  Product? product;
  Customer? customer;
  String? review;
  String? rating;
  String? date;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  List1(
      {this.sId,
        this.product,
        this.customer,
        this.review,
        this.rating,
        this.date,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  List1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    product = Product.fromJson(json['Product'] ?? {});
    customer = Customer.fromJson(json['Customer'] ?? {});
    review = json['Review'] ?? "";
    rating = json['Rating'].toString();
    date = json['Date'] ?? "";
    isActive = json['IsActive'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.product != null) {
      data['Product'] = this.product!.toJson();
    }
    if (this.customer != null) {
      data['Customer'] = this.customer!.toJson();
    }
    data['Review'] = this.review;
    data['Rating'] = this.rating;
    data['Date'] = this.date;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Customer {
  String? sId;
  String? userName;
  String? fullName;
  String? phone;
  String? email;
  String? password;
  String? address;
  String? cityId;
  String? areaId;
  String? gender;
  String? photo;
  bool? isActive;
  String? roleId;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? lastLogin;
  String? reseLink;
  String? createdBy;
  String? updatedBy;

  Customer(
      {this.sId,
        this.userName,
        this.fullName,
        this.phone,
        this.email,
        this.password,
        this.address,
        this.cityId,
        this.areaId,
        this.gender,
        this.photo,
        this.isActive,
        this.roleId,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.lastLogin,
        this.reseLink,
        this.createdBy,
        this.updatedBy});

  Customer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    userName = json['UserName'] ?? "";
    fullName = json['FullName']?? "";
    phone = json['Phone'] ?? "";
    email = json['Email'] ?? "";
    password = json['Password'] ?? "";
    address = json['Address'] ?? "";
    cityId = json['CityId'] ?? "";
    areaId = json['AreaId'] ?? "";
    gender = json['Gender'] ?? "";
    photo = json['Photo'] ?? "";
    isActive = json['IsActive'] ?? false;
    roleId = json['RoleId'] ?? "";
    isVerified = json['IsVerified'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
    lastLogin = json['LastLogin'] ?? "";
    reseLink = json['reseLink'] ?? "";
    createdBy = json['CreatedBy'] ?? "";
    updatedBy = json['UpdatedBy'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['UserName'] = this.userName;
    data['FullName'] = this.fullName;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Address'] = this.address;
    data['CityId'] = this.cityId;
    data['AreaId'] = this.areaId;
    data['Gender'] = this.gender;
    data['Photo'] = this.photo;
    data['IsActive'] = this.isActive;
    data['RoleId'] = this.roleId;
    data['IsVerified'] = this.isVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['LastLogin'] = this.lastLogin;
    data['reseLink'] = this.reseLink;
    data['CreatedBy'] = this.createdBy;
    data['UpdatedBy'] = this.updatedBy;
    return data;
  }
}

class Product {
  ProductType? productType;
  ProductType? discountType;
  String? sId;
  String? category;
  String? subCategory;
  String? store;
  int? discount;
  String? productName;
  int? quantity;
  int? mRP;
  int? price;
  String? startTime;
  String? endTime;
  List<Attribute>? attribute;
  List<Addon1>? addon;
  bool? isFeatured;
  String? description;
  int? numberOfReviews;
  ///double? rating;
  String? image;
  bool? isApproved;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.productType,
        this.discountType,
        this.sId,
        this.category,
        this.subCategory,
        this.store,
        this.discount,
        this.productName,
        this.quantity,
        this.mRP,
        this.price,
        this.startTime,
        this.endTime,
        this.attribute,
        this.addon,
        this.isFeatured,
        this.description,
        this.numberOfReviews,
        //this.rating,
        this.image,
        this.isApproved,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    productType = ProductType.fromJson(json['ProductType'] ?? {});
    discountType = ProductType.fromJson(json['DiscountType'] ?? {});
    sId = json['_id'] ?? "";
    category = json['Category'] ?? "";
    subCategory = json['SubCategory'] ?? "";
    store = json['Store'] ?? "";
    discount = json['Discount'] ?? 0;
    productName = json['ProductName'] ?? "";
    quantity = json['Quantity'] ?? 0;
    mRP = json['MRP'] ?? 0;
    price = json['Price'] ?? 0;
    startTime = json['StartTime'] ?? "";
    endTime = json['EndTime'] ?? "";
    if (json['Attribute'] != null) {
      attribute = <Attribute>[];
      json['Attribute'].forEach((v) {
        attribute!.add(new Attribute.fromJson(v));
      });
    }
    if (json['Addon'] != null) {
      addon = <Addon1>[];
      json['Addon'].forEach((v) {
        addon!.add(new Addon1.fromJson(v));
      });
    }
    isFeatured = json['IsFeatured'] ?? false;
    description = json['Description'] ?? "";
    numberOfReviews = json['NumberOfReviews'] ?? 0;
    //rating = json['Rating'];
    image = json['Image'] ?? "";
    isApproved = json['IsApproved'] ?? false;
    isActive = json['IsActive'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
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
    data['Store'] = this.store;
    data['Discount'] = this.discount;
    data['ProductName'] = this.productName;
    data['Quantity'] = this.quantity;
    data['MRP'] = this.mRP;
    data['Price'] = this.price;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    if (this.attribute != null) {
      data['Attribute'] = this.attribute!.map((v) => v.toJson()).toList();
    }
    if (this.addon != null) {
      data['Addon'] = this.addon!.map((v) => v.toJson()).toList();
    }
    data['IsFeatured'] = this.isFeatured;
    data['Description'] = this.description;
    data['NumberOfReviews'] = this.numberOfReviews;
    //data['Rating'] = this.rating;
    data['Image'] = this.image;
    data['IsApproved'] = this.isApproved;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductType {
  String? value;
  String? label;

  ProductType({this.value, this.label});

  ProductType.fromJson(Map<String, dynamic> json) {
    value = json['value'] ?? "";
    label = json['label'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Attribute {
  String? value;
  String? label;
  String? sId;

  Attribute({this.value, this.label, this.sId});

  Attribute.fromJson(Map<String, dynamic> json) {
    value = json['value'] ?? "";
    label = json['label'] ?? "";
    sId = json['_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    data['_id'] = this.sId;
    return data;
  }
}

class Addon1 {
  String? value;
  String? label;
  String? sId;

  Addon1({this.value, this.label, this.sId});

  Addon1.fromJson(Map<String, dynamic> json) {
    value = json['value'] ?? "";
    label = json['label'] ?? "";
    sId = json['_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    data['_id'] = this.sId;
    return data;
  }
}