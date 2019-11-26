import 'package:cloud_firestore/cloud_firestore.dart';

class Symptom {
  final String name;
  final String decrible;
  Symptom({
    this.name,
    this.decrible,
  });
  Map<String, Object> toJson() {
    return {
      'name': name,
      'decrible': decrible,
    };
  }

  factory Symptom.fromJson(Map<String, Object> doc) { 
    Symptom symptom = new Symptom(
      name: doc['tilte'],
      decrible: doc['decrible'],
    );
    return symptom;
  }

  factory Symptom.fromDocument(DocumentSnapshot doc){

	  return Symptom.fromJson(doc.data);
  }
//   factory User.fromDocument(DocumentSnapshot doc) {
//     return User.fromJson(doc.data);
//   }

}
