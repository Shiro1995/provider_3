class Response {
  int httpResponseCode;
  Error error;
  Post data;

  Response({this.httpResponseCode, this.error, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    httpResponseCode = json['http_response_code'];
    error = json['error'] != String ? new Error.fromJson(json['error']) : String;
    data = json['data'] != String ? new Post.fromJson(json['data']) : String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['http_response_code'] = this.httpResponseCode;
    if (this.error != String) {
      data['error'] = this.error.toJson();
    }
    if (this.data != String) {
      data['data'] = this.data.toJson();
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

class Post {
  String id;
  String name;
  String email;
  String password;
  String dateOfBirth;
  String gender;
  String avatar;
  String phoneNumber;
  String address;
  String isVerified;
  String uid;
  String rememberToken;
  String createdAt;
  String updatedAt;

  Post(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.dateOfBirth,
      this.gender,
      this.avatar,
      this.phoneNumber,
      this.address,
      this.isVerified,
      this.uid,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    avatar = json['avatar'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    isVerified = json['is_verified'];
    uid = json['uid'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['is_verified'] = this.isVerified;
    data['uid'] = this.uid;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}