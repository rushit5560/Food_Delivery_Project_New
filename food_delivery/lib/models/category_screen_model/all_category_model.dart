class AllCategoryModel {
  bool? status;
  String? message;
  List<AllCategory>? allCategory;

  AllCategoryModel({this.status, this.message, this.allCategory});

  AllCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "";
    if (json['allCategory'] != null) {
      allCategory = <AllCategory>[];
      json['allCategory'].forEach((v) {
        allCategory!.add(new AllCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.allCategory != null) {
      data['allCategory'] = this.allCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCategory {
  String? sId;
  String? name;
  List<Restaurants>? restaurants;
  String? image;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AllCategory(
      {this.sId,
        this.name,
        this.restaurants,
        this.image,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  AllCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    name = json['Name'] ?? "";
    if (json['Restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['Restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
    image = json['Image'] ?? "";
    isActive = json['IsActive'] ?? false;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    if (this.restaurants != null) {
      data['Restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    data['Image'] = this.image;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Restaurants {
  Value? value;
  String? sId;

  Restaurants({this.value, this.sId});

  Restaurants.fromJson(Map<String, dynamic> json) {
    value = Value.fromJson(json['value'] ?? {});
    sId = json['_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Value {
  String? sId;
  String? storeName;
  String? address;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? phone;
  String? deliveryRange;
  String? startTime;
  String? endTime;
  String? image;
  String? coverImage;
  String? roleId;
  bool? isActive;
  bool? isApproved;
  String? createdBy;
  String? updatedBy;
  String? approvedOn;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? latitude;
  String? longitude;
  String? maxDeliveryTime;
  String? minDeliveryTime;
  String? tax;
  String? zone;
  int? numberOfReviews;
  //double? rating;
  //List<String>? campaignjoin;

  Value(
      {this.sId,
        this.storeName,
        this.address,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.phone,
        this.deliveryRange,
        this.startTime,
        this.endTime,
        this.image,
        this.coverImage,
        this.roleId,
        this.isActive,
        this.isApproved,
        this.createdBy,
        this.updatedBy,
        this.approvedOn,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.latitude,
        this.longitude,
        this.maxDeliveryTime,
        this.minDeliveryTime,
        this.tax,
        this.zone,
        this.numberOfReviews,
        //this.rating,
        //this.campaignjoin
      });

  Value.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    storeName = json['StoreName'] ?? "";
    address = json['Address'] ?? "";
    firstName = json['FirstName'] ?? "";
    lastName = json['LastName'] ?? "";
    email = json['Email'] ?? "";
    password = json['Password'] ?? "";
    phone = json['Phone'] ?? 0;
    deliveryRange = json['DeliveryRange'] ?? "";
    startTime = json['StartTime'] ?? "";
    endTime = json['EndTime'] ?? "";
    image = json['Image'] ?? "";
    coverImage = json['CoverImage'] ?? "";
    roleId = json['RoleId'] ?? "";
    isActive = json['IsActive'] ?? false;
    isApproved = json['IsApproved'] ?? false;
    createdBy = json['CreatedBy'] ?? "";
    updatedBy = json['UpdatedBy'] ?? "";
    approvedOn = json['ApprovedOn'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    iV = json['__v'] ?? 0;
    latitude = json['Latitude'] ?? "";
    longitude = json['Longitude'] ?? "";
    maxDeliveryTime = json['MaxDeliveryTime'] ?? "";
    minDeliveryTime = json['MinDeliveryTime'] ?? "";
    tax = json['Tax'] ?? "";
    zone = json['Zone'] ?? "";
    numberOfReviews = json['NumberOfReviews'] ?? 0;
    //rating = json['Rating'] ?? 0.0;
    //campaignjoin = json['campaignjoin'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['StoreName'] = this.storeName;
    data['Address'] = this.address;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Phone'] = this.phone;
    data['DeliveryRange'] = this.deliveryRange;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['Image'] = this.image;
    data['CoverImage'] = this.coverImage;
    data['RoleId'] = this.roleId;
    data['IsActive'] = this.isActive;
    data['IsApproved'] = this.isApproved;
    data['CreatedBy'] = this.createdBy;
    data['UpdatedBy'] = this.updatedBy;
    data['ApprovedOn'] = this.approvedOn;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['MaxDeliveryTime'] = this.maxDeliveryTime;
    data['MinDeliveryTime'] = this.minDeliveryTime;
    data['Tax'] = this.tax;
    data['Zone'] = this.zone;
    data['NumberOfReviews'] = this.numberOfReviews;
    //data['Rating'] = this.rating;
    //data['campaignjoin'] = this.campaignjoin;
    return data;
  }
}
