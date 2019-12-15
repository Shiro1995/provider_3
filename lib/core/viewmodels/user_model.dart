import 'package:final_1/core/model/user.dart';
import 'package:final_1/core/services/Auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider {
  User _user;

  get user => _user;

  set user(User user) {
    _user = user;
    // notifyListeners();
  }

  Future<User> getInfo() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      User newUser = User(
        firstName: user.displayName,
        userID: user.uid,
        email: user.email ?? '',
        profilePictureURL: user.photoUrl ?? '',
      );
	  print(newUser.address+"address");
	return newUser;
	// print('new info:'+_user.address);
	// notifyListeners();
    });
  }
}
