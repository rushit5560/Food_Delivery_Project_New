/*
class AllCityModel {
  String? sId;
  String? cityName;
  CountryId? countryId;
  StateId? stateId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AllCityModel(
      {this.sId,
      this.cityName,
      this.countryId,
      this.stateId,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AllCityModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityName = json['CityName'];
    countryId = json['country_id'] != null
        ? new CountryId.fromJson(json['country_id'])
        : null;
    stateId = json['state_id'] != null
        ? new StateId.fromJson(json['state_id'])
        : null;
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['CityName'] = this.cityName;
    if (this.countryId != null) {
      data['country_id'] = this.countryId!.toJson();
    }
    if (this.stateId != null) {
      data['state_id'] = this.stateId!.toJson();
    }
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CountryId {
  String? sId;
  String? countryName;
  String? countryCode;
  String? flag;
  String? currency;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CountryId(
      {this.sId,
      this.countryName,
      this.countryCode,
      this.flag,
      this.currency,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CountryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    countryName = json['CountryName'];
    countryCode = json['CountryCode'];
    flag = json['Flag'];
    currency = json['Currency'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['CountryName'] = this.countryName;
    data['CountryCode'] = this.countryCode;
    data['Flag'] = this.flag;
    data['Currency'] = this.currency;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class StateId {
  String? sId;
  String? stateName;
  String? stateCode;
  String? countryId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? modifiedBy;

  StateId(
      {this.sId,
      this.stateName,
      this.stateCode,
      this.countryId,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.modifiedBy});

  StateId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    stateName = json['StateName'];
    stateCode = json['StateCode'];
    countryId = json['country_id'];
    isActive = json['IsActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    modifiedBy = json['ModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['StateName'] = this.stateName;
    data['StateCode'] = this.stateCode;
    data['country_id'] = this.countryId;
    data['IsActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['ModifiedBy'] = this.modifiedBy;
    return data;
  }
}
*/
