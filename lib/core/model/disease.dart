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
      'name': classify,
      'decrible': decrible,
    };
  }

  factory Disease.fromJson(Map<String, Object> doc) { 
    Disease disease = new Disease(
      name: doc['tilte'],
      classify: doc['image'],
      decrible: doc['decrible'],
    );
    return disease;
  }

  factory Disease.fromDocument(DocumentSnapshot doc){

	  return Disease.fromJson(doc.data);
  }
//   factory User.fromDocument(DocumentSnapshot doc) {
//     return User.fromJson(doc.data);
//   }

}
