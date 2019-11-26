import 'package:final_1/core/model/user.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
	User _user;

	get user => _user;

	set user(User user){
		_user = user;
		notifyListeners();
	}

	Future<void> getInfo(FirebaseUser user) async{
		// user = await Auth.getUser(user.uid),
	}
}