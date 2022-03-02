class GetAllProductsModel {
  final bool? status;
  final String? message;
  final List<GetList>? getList;

  GetAllProductsModel({
    this.status,
    this.message,
    this.getList,
  });

  GetAllProductsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        getList = (json['getList'] as List?)?.map((dynamic e) => GetList.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'getList' : getList?.map((e) => e.toJson()).toList()
  };
}

class GetList {
  final ProductType? productType;
  final DiscountType? discountType;
  final String? id;
  final dynamic category;
  final dynamic subCategory;
  final Store? store;
  final String? productName;
  final int? quantity;
  final int? mRP;
  final int? price;
  final List<Attribute>? attribute;
  final List<Addon>? addon;
  final bool? isFeatured;
  final String? description;
  final bool? isApproved;
  final bool? isActive;
  final String? createdBy;
  final String? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? discount;

  GetList({
    this.productType,
    this.discountType,
    this.id,
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
    this.v,
    this.discount,
  });

  GetList.fromJson(Map<String, dynamic> json)
      : productType = (json['ProductType'] as Map<String,dynamic>?) != null ? ProductType.fromJson(json['ProductType'] as Map<String,dynamic>) : null,
        discountType = (json['DiscountType'] as Map<String,dynamic>?) != null ? DiscountType.fromJson(json['DiscountType'] as Map<String,dynamic>) : null,
        id = json['_id'] as String?,
        category = json['Category'],
        subCategory = json['SubCategory'],
        store = (json['Store'] as Map<String,dynamic>?) != null ? Store.fromJson(json['Store'] as Map<String,dynamic>) : null,
        productName = json['ProductName'] as String?,
        quantity = json['Quantity'] as int?,
        mRP = json['MRP'] as int?,
        price = json['Price'] as int?,
        attribute = (json['Attribute'] as List?)?.map((dynamic e) => Attribute.fromJson(e as Map<String,dynamic>)).toList(),
        addon = (json['Addon'] as List?)?.map((dynamic e) => Addon.fromJson(e as Map<String,dynamic>)).toList(),
        isFeatured = json['IsFeatured'] as bool?,
        description = json['Description'] as String?,
        isApproved = json['IsApproved'] as bool?,
        isActive = json['IsActive'] as bool?,
        createdBy = json['CreatedBy'] as String?,
        updatedBy = json['UpdatedBy'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?,
        discount = json['Discount'] as int?;

  Map<String, dynamic> toJson() => {
    'ProductType' : productType?.toJson(),
    'DiscountType' : discountType?.toJson(),
    '_id' : id,
    'Category' : category,
    'SubCategory' : subCategory,
    'Store' : store?.toJson(),
    'ProductName' : productName,
    'Quantity' : quantity,
    'MRP' : mRP,
    'Price' : price,
    'Attribute' : attribute?.map((e) => e.toJson()).toList(),
    'Addon' : addon?.map((e) => e.toJson()).toList(),
    'IsFeatured' : isFeatured,
    'Description' : description,
    'IsApproved' : isApproved,
    'IsActive' : isActive,
    'CreatedBy' : createdBy,
    'UpdatedBy' : updatedBy,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v,
    'Discount' : discount
  };
}

class ProductType {
  final String? value;
  final String? label;

  ProductType({
    this.value,
    this.label,
  });

  ProductType.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?,
        label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'value' : value,
    'label' : label
  };
}

class DiscountType {
  final String? value;
  final String? label;

  DiscountType({
    this.value,
    this.label,
  });

  DiscountType.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?,
        label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'value' : value,
    'label' : label
  };
}

class Store {
  final String? id;
  final String? storeName;
  final String? tax;
  final String? address;
  final String? minDeliveryTime;
  final String? maxDeliveryTime;
  final String? zone;
  final String? latitude;
  final String? longitude;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final int? phone;
  final String? deliveryRange;
  final String? startTime;
  final String? endTime;
  final String? image;
  final String? roleId;
  final bool? isActive;
  final bool? isApproved;
  final String? createdBy;
  final String? updatedBy;
  final String? approvedOn;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Store({
    this.id,
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
    this.v,
  });

  Store.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        storeName = json['StoreName'] as String?,
        tax = json['Tax'] as String?,
        address = json['Address'] as String?,
        minDeliveryTime = json['MinDeliveryTime'] as String?,
        maxDeliveryTime = json['MaxDeliveryTime'] as String?,
        zone = json['Zone'] as String?,
        latitude = json['Latitude'] as String?,
        longitude = json['Longitude'] as String?,
        firstName = json['FirstName'] as String?,
        lastName = json['LastName'] as String?,
        email = json['Email'] as String?,
        password = json['Password'] as String?,
        phone = json['Phone'] as int?,
        deliveryRange = json['DeliveryRange'] as String?,
        startTime = json['StartTime'] as String?,
        endTime = json['EndTime'] as String?,
        image = json['Image'] as String?,
        roleId = json['RoleId'] as String?,
        isActive = json['IsActive'] as bool?,
        isApproved = json['IsApproved'] as bool?,
        createdBy = json['CreatedBy'] as String?,
        updatedBy = json['UpdatedBy'] as String?,
        approvedOn = json['ApprovedOn'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'StoreName' : storeName,
    'Tax' : tax,
    'Address' : address,
    'MinDeliveryTime' : minDeliveryTime,
    'MaxDeliveryTime' : maxDeliveryTime,
    'Zone' : zone,
    'Latitude' : latitude,
    'Longitude' : longitude,
    'FirstName' : firstName,
    'LastName' : lastName,
    'Email' : email,
    'Password' : password,
    'Phone' : phone,
    'DeliveryRange' : deliveryRange,
    'StartTime' : startTime,
    'EndTime' : endTime,
    'Image' : image,
    'RoleId' : roleId,
    'IsActive' : isActive,
    'IsApproved' : isApproved,
    'CreatedBy' : createdBy,
    'UpdatedBy' : updatedBy,
    'ApprovedOn' : approvedOn,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class Attribute {
  final dynamic value;
  final String? label;
  final String? id;

  Attribute({
    this.value,
    this.label,
    this.id,
  });

  Attribute.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        label = json['label'] as String?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {
    'value' : value,
    'label' : label,
    '_id' : id
  };
}

class Addon {
  final Value? value;
  final String? label;
  final String? id;

  Addon({
    this.value,
    this.label,
    this.id,
  });

  Addon.fromJson(Map<String, dynamic> json)
      : value = (json['value'] as Map<String,dynamic>?) != null ? Value.fromJson(json['value'] as Map<String,dynamic>) : null,
        label = json['label'] as String?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {
    'value' : value?.toJson(),
    'label' : label,
    '_id' : id
  };
}

class Value {
  final String? id;
  final Restaurant? restaurant;
  final String? name;
  final String? price;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Value({
    this.id,
    this.restaurant,
    this.name,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Value.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        restaurant = (json['Restaurant'] as Map<String,dynamic>?) != null ? Restaurant.fromJson(json['Restaurant'] as Map<String,dynamic>) : null,
        name = json['Name'] as String?,
        price = json['Price'] as String?,
        isActive = json['IsActive'] as bool?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'Restaurant' : restaurant?.toJson(),
    'Name' : name,
    'Price' : price,
    'IsActive' : isActive,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class Restaurant {
  final String? id;
  final String? storeName;
  final String? tax;
  final String? address;
  final String? minDeliveryTime;
  final String? maxDeliveryTime;
  final String? zone;
  final String? latitude;
  final String? longitude;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final int? phone;
  final String? deliveryRange;
  final String? startTime;
  final String? endTime;
  final String? image;
  final RoleId? roleId;
  final bool? isActive;
  final bool? isApproved;
  final String? createdBy;
  final String? updatedBy;
  final String? approvedOn;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Restaurant({
    this.id,
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
    this.v,
  });

  Restaurant.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        storeName = json['StoreName'] as String?,
        tax = json['Tax'] as String?,
        address = json['Address'] as String?,
        minDeliveryTime = json['MinDeliveryTime'] as String?,
        maxDeliveryTime = json['MaxDeliveryTime'] as String?,
        zone = json['Zone'] as String?,
        latitude = json['Latitude'] as String?,
        longitude = json['Longitude'] as String?,
        firstName = json['FirstName'] as String?,
        lastName = json['LastName'] as String?,
        email = json['Email'] as String?,
        password = json['Password'] as String?,
        phone = json['Phone'] as int?,
        deliveryRange = json['DeliveryRange'] as String?,
        startTime = json['StartTime'] as String?,
        endTime = json['EndTime'] as String?,
        image = json['Image'] as String?,
        roleId = (json['RoleId'] as Map<String,dynamic>?) != null ? RoleId.fromJson(json['RoleId'] as Map<String,dynamic>) : null,
        isActive = json['IsActive'] as bool?,
        isApproved = json['IsApproved'] as bool?,
        createdBy = json['CreatedBy'] as String?,
        updatedBy = json['UpdatedBy'] as String?,
        approvedOn = json['ApprovedOn'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'StoreName' : storeName,
    'Tax' : tax,
    'Address' : address,
    'MinDeliveryTime' : minDeliveryTime,
    'MaxDeliveryTime' : maxDeliveryTime,
    'Zone' : zone,
    'Latitude' : latitude,
    'Longitude' : longitude,
    'FirstName' : firstName,
    'LastName' : lastName,
    'Email' : email,
    'Password' : password,
    'Phone' : phone,
    'DeliveryRange' : deliveryRange,
    'StartTime' : startTime,
    'EndTime' : endTime,
    'Image' : image,
    'RoleId' : roleId?.toJson(),
    'IsActive' : isActive,
    'IsApproved' : isApproved,
    'CreatedBy' : createdBy,
    'UpdatedBy' : updatedBy,
    'ApprovedOn' : approvedOn,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class RoleId {
  final String? id;
  final String? roleName;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  RoleId({
    this.id,
    this.roleName,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  RoleId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        roleName = json['RoleName'] as String?,
        isActive = json['IsActive'] as bool?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'RoleName' : roleName,
    'IsActive' : isActive,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}