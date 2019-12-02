import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Disease {
  final String name;
  final String classify;
  final String decrible;
  Disease({
    this.name,
    this.classify,
    this.decrible,
  });
  Map<String, Object> toJson() {
    return {
      'name': name,
      'classify': classify,
      'decrible': decrible,
    };
  }

  factory Disease.fromJson(Map<String,dynamic> json) {
    Disease user = new Disease(
    //   name: json['userId'],
      classify: json['data']['android-min-version'],
      decrible: json['data']['android-latest-version'],
    );
    return user;
  }

//   factory User.fromDocument(DocumentSnapshot doc) {
//     return User.fromJson(doc.data);
//   }

}
