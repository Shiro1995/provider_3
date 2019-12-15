import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userID;
  final String firstName;
  final String email;
  final String address;
  final String profilePictureURL;
  final String dateofbirth;
  final String gender;
  User({
    this.address,
    this.dateofbirth,
    this.gender,
    this.userID,
    this.firstName,
    this.email,
    this.profilePictureURL,
  });

  Map<String, Object> toJson() {
    return {
      'userID': userID,
      'firstName': firstName,
      'email': email == null ? '' : email,
      'profilePictureURL': profilePictureURL,
      'appIdentifier': 'personal-healthcare'
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
      userID: doc['userID'],
      firstName: doc['firstName'],
      email: doc['email'],
      profilePictureURL: doc['profilePictureURL'],
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}
