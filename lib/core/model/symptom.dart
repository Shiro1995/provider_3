class SymptomList {
  int httpResponseCode;
  Error error;
  Symptom data;

  SymptomList({this.httpResponseCode, this.error, this.data});

  SymptomList.fromJson(Map<String, dynamic> json) {
    httpResponseCode = json['http_response_code'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    data = json['data'] != null ? new Symptom.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['http_response_code'] = this.httpResponseCode;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    if (this.data != null) {
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

class Symptom {
  List<Definitions> definitions;
  List<Prognostics> prognostics;

  Symptom({this.definitions, this.prognostics});

  Symptom.fromJson(Map<String, dynamic> json) {
    if (json['definitions'] != null) {
      definitions = new List<Definitions>();
      json['definitions'].forEach((v) {
        definitions.add(new Definitions.fromJson(v));
      });
    }
    if (json['prognostics'] != null) {
      prognostics = new List<Prognostics>();
      json['prognostics'].forEach((v) {
        prognostics.add(new Prognostics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.definitions != null) {
      data['definitions'] = this.definitions.map((v) => v.toJson()).toList();
    }
    if (this.prognostics != null) {
      data['prognostics'] = this.prognostics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String id;
  String name;
  String diseaseId;
  String createdAt;
  String updatedAt;

  Definitions(
      {this.id, this.name, this.diseaseId, this.createdAt, this.updatedAt});

  Definitions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    diseaseId = json['disease_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['disease_id'] = this.diseaseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Prognostics {
  String id;
  String name;
  String diseaseId;
  String createdAt;
  String updatedAt;

  Prognostics(
      {this.id, this.name, this.diseaseId, this.createdAt, this.updatedAt});

  Prognostics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    diseaseId = json['disease_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['disease_id'] = this.diseaseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}