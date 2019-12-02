import 'package:cloud_firestore/cloud_firestore.dart';

class Test {
  final String name;
  final String classify;
  final String decrible;
  Test({
    this.name,
    this.classify,
    this.decrible,
  });
  Map<String, Object> toJson() {
    return {
      'name': name,
      'name': classify,
      'decrible': decrible,
    };
  }

  factory Test.fromJson(Map<String, Object> doc) { 
    Test disease = new Test(
      name: doc['baseUrl'],
      classify: doc['android-min-version'],
      decrible: doc['android-latest-version'],
    );
    return disease;
  }

  factory Test.fromDocument(DocumentSnapshot doc){
	  return Test.fromJson(doc.data);
  }
//   factory User.fromDocument(DocumentSnapshot doc) {
//     return User.fromJson(doc.data);
//   }

}
