class Diseaselist {
  int httpResponseCode;
  Error error;
  List<Disease> data;

  Diseaselist({this.httpResponseCode, this.error, this.data});

  Diseaselist.fromJson(Map<String, dynamic> json) {
    httpResponseCode = json['http_response_code'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    if (json['data'] != null) {
      data = new List<Disease>();
      json['data'].forEach((v) {
        data.add(new Disease.fromJson(v));
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


class Disease {
  String id;
  String name;
  String description;
  String level;
  String parentId;
  String isEditable;
  String status;
  String locate;
  Null type;
  Null path;
  String createdAt;
  String updatedAt;

  Disease(
      {this.id,
      this.name,
      this.description,
      this.level,
      this.parentId,
      this.isEditable,
      this.status,
      this.locate,
      this.type,
      this.path,
      this.createdAt,
      this.updatedAt});

  Disease.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    level = json['level'];
    parentId = json['parent_id'];
    isEditable = json['is_editable'];
    status = json['status'];
    locate = json['locate'];
    type = json['type'];
    path = json['path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['level'] = this.level;
    data['parent_id'] = this.parentId;
    data['is_editable'] = this.isEditable;
    data['status'] = this.status;
    data['locate'] = this.locate;
    data['type'] = this.type;
    data['path'] = this.path;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}