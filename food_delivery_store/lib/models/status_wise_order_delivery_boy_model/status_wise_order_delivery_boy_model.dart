class StatusWiseOrderDeliveryBoyModel {
  bool? status;
  List<GetList>? getList;

  StatusWiseOrderDeliveryBoyModel({this.status, this.getList});

  StatusWiseOrderDeliveryBoyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    if (json['getList'] != null) {
      getList = <GetList>[];
      json['getList'].forEach((v) {
        getList!.add(new GetList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.getList != null) {
      data['getList'] = this.getList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetList {
  String? reseLink;
  String? sId;
  String? firstName;
  String? lastName;
  int? phone;
  String? password;
  String? gender;
  String? zone;
  String? roleId;
  String? address;
  String? deliveryManType;
  String? identityType;
  String? identityNumber;
  bool? isActive;
  String? email;
  String? identityImage;
  bool? isVerified;
  int? iV;
  String? restaurant;
  //double? rating;
  int? numberOfReviews;
  bool? isSuspended;
  String? image;

  GetList(
      {this.reseLink,
        this.sId,
        this.firstName,
        this.lastName,
        this.phone,
        this.password,
        this.gender,
        this.zone,
        this.roleId,
        this.address,
        this.deliveryManType,
        this.identityType,
        this.identityNumber,
        this.isActive,
        this.email,
        this.identityImage,
        this.isVerified,
        this.iV,
        this.restaurant,
        //this.rating,
        this.numberOfReviews,
        this.isSuspended,
        this.image});

  GetList.fromJson(Map<String, dynamic> json) {
    reseLink = json['reseLink'] ?? "";
    sId = json['_id'] ?? "";
    firstName = json['FirstName'] ?? "";
    lastName = json['LastName'] ?? "";
    phone = json['Phone'] ?? 0;
    password = json['Password'] ?? "";
    gender = json['Gender'] ?? "";
    zone = json['Zone'] ?? "";
    roleId = json['RoleId'] ?? "";
    address = json['Address'] ?? "";
    deliveryManType = json['DeliveryManType'] ?? "";
    identityType = json['IdentityType'] ?? "";
    identityNumber = json['IdentityNumber'] ?? "";
    isActive = json['IsActive'] ?? false;
    email = json['Email'] ?? "";
    identityImage = json['IdentityImage'] ?? "";
    isVerified = json['IsVerified'] ?? false;
    iV = json['__v'] ?? 0;
    restaurant = json['Restaurant'] ?? "";
    //rating = json['Rating'];
    numberOfReviews = json['NumberOfReviews'] ?? 0;
    isSuspended = json['IsSuspended'] ?? false;
    image = json['Image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reseLink'] = this.reseLink;
    data['_id'] = this.sId;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Phone'] = this.phone;
    data['Password'] = this.password;
    data['Gender'] = this.gender;
    data['Zone'] = this.zone;
    data['RoleId'] = this.roleId;
    data['Address'] = this.address;
    data['DeliveryManType'] = this.deliveryManType;
    data['IdentityType'] = this.identityType;
    data['IdentityNumber'] = this.identityNumber;
    data['IsActive'] = this.isActive;
    data['Email'] = this.email;
    data['IdentityImage'] = this.identityImage;
    data['IsVerified'] = this.isVerified;
    data['__v'] = this.iV;
    data['Restaurant'] = this.restaurant;
    //data['Rating'] = this.rating;
    data['NumberOfReviews'] = this.numberOfReviews;
    data['IsSuspended'] = this.isSuspended;
    data['Image'] = this.image;
    return data;
  }
}
