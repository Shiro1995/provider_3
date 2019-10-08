import 'package:cloud_firestore/cloud_firestore.dart';

class Disease {
  final String tilte;
  final String image;
  final String decrible;
  Disease({
    this.tilte,
    this.image,
    this.decrible,
  });
  Map<String, Object> toJson() {
    return {
      'tilte': tilte,
      'image': image,
      'decrible': decrible,
    };
  }

  factory Disease.fromJson(Map<String, Object> doc) {
    Disease disease = new Disease(
      tilte: doc['tilte'],
      image: doc['image'],
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
