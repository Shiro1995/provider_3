class PharmaciesList {
  int httpResponseCode;
  Error error;
  List<Pharmacy> data;

  PharmaciesList({this.httpResponseCode, this.error, this.data});

  PharmaciesList.fromJson(Map<String, dynamic> json) {
    httpResponseCode = json['http_response_code'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    if (json['data'] != null) {
      data = new List<Pharmacy>();
      json['data'].forEach((v) {
        data.add(new Pharmacy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['http_response_code'] = this.httpResponseCode;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Error {
  int code;
  String message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Pharmacy {
  String accountId;
  String name;
  Null imageStore;
  String address;
  String phoneNumber;
  String openTime;
  String closeTime;
  Null createdAt;
  Null updatedAt;

  Pharmacy(
      {this.accountId,
      this.name,
      this.imageStore,
      this.address,
      this.phoneNumber,
      this.openTime,
      this.closeTime,
      this.createdAt,
      this.updatedAt});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    name = json['name'];
    imageStore = json['image_store'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['name'] = this.name;
    data['image_store'] = this.imageStore;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['open_time'] = this.openTime;
    data['close_time'] = this.closeTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
