import 'dart:async';

import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/core/services/api.dart';
import 'package:final_1/core/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final Api _api;

  Auth({Api api}) : _api = api;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  static Future<String> getID() async {
    String id;
    getCurrentFirebaseUser().then((info) {
      User user = new User(
        firstName: info.displayName,
        userID: info.uid,
        email: info.email ?? '',
        profilePictureURL: info.photoUrl ?? '',
      );
      id = user.userID;
    });
    return id;
  }
   static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static void addUser(User user) async {
    checkUserExist(user.userID).then((value) {
      if (!value) {
        print("user ${user.firstName} ${user.email} added");
        Firestore.instance
            .document("users/${user.userID}")
            .setData(user.toJson());
      } else {
        print("user ${user.firstName} ${user.email} exists");
      }
    });
  }

  static Future<void> loginWithFacebook(context) async {
    var fbLogin = FacebookLogin();
    FacebookLoginResult result;
    try {
      result =
          await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          var accessToken = result.accessToken;
          print(accessToken.token);
          final AuthCredential credential = FacebookAuthProvider.getCredential(
              accessToken: accessToken.token);
          final FirebaseUser user =
              (await FirebaseAuth.instance.signInWithCredential(credential))
                  .user;
          print('===========================');
          print(user);
          FirebaseAuth.instance.currentUser().then((firebaseUser) {
			  print('hiiiiisdf');
            User user = new User(
              firstName: firebaseUser.displayName,
              userID: firebaseUser.uid,
              email: firebaseUser.email ?? '',
              profilePictureURL: firebaseUser.photoUrl ?? '',
            );
            Auth.addUser(user);
			print('adasdhihi');
			print(Auth.getUser('0MI7ZZ41GyVDLblwWGKqIj24zKZ2'));
             Navigator.of(context).pushNamed(RoutePaths.Root);
          });
          break;
        case FacebookLoginStatus.cancelledByUser:
        //   throw ErrorHint("CANCEL_BY_USER");
        //   break;
        case FacebookLoginStatus.error:
        //   throw ErrorHint("UNKNOWN ERROR");
          break;
      }
      return null;
    } catch (error) {
    //   throw ErrorHint(error.code);
    }
  }

  static Stream<User> getUser(String userID) {
    return Firestore.instance
        .collection("users")
        .where("userID", isEqualTo: userID)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents.map((doc) {
        return User.fromDocument(doc);
      }).first;
    });
  }

  static Future<bool> checkUserExist(String userID) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$userID").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  Future<FirebaseUser> loginWithFacebook1(context) async {
    var fbLogin = FacebookLogin();
    FacebookLoginResult result;
    try {
      result =
          await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          var accessToken = result.accessToken;
          print(accessToken.token);
          final AuthCredential credential = FacebookAuthProvider.getCredential(
              accessToken: accessToken.token);
          final FirebaseUser user =
              (await FirebaseAuth.instance.signInWithCredential(credential))
                  .user;
          print('===========================');
          print(user);
          return user;

          //   Auth.getCurrentFirebaseUser().then((firebaseUser) {
          //     User user = new User(
          //       firstName: firebaseUser.displayName,
          //       userID: firebaseUser.uid,
          //       email: firebaseUser.email ?? '',
          //       profilePictureURL: firebaseUser.photoUrl ?? '',
          //     );
          //     Auth.addUser(user);
          //   });
          break;
        case FacebookLoginStatus.cancelledByUser:
          throw ErrorHint("CANCEL_BY_USER");
          break;
        case FacebookLoginStatus.error:
          throw ErrorHint("UNKNOWN ERROR");
          break;
      }
    } catch (error) {
      throw ErrorHint(error.code);
    }
  }

//   Future<bool> login(int userId) async {
//     var fetchedUser = await _api.getUserProfile(userId);

//     var hasUser = fetchedUser != null;
//     if (hasUser) {
//       _userController.add(fetchedUser);
//     }

//     return hasUser;
//   }

}
