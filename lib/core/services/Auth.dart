import 'dart:async';
import 'dart:convert';

import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/core/model/pharmacy.dart';
import 'package:final_1/core/model/post.dart';
import 'package:final_1/core/model/user.dart';
import 'package:final_1/ui/view/main_view/root_screen.dart';
import 'package:final_1/ui/view/view_component/pharmacy/Pharmacy.dart';
import 'package:final_1/ui/view/view_component/second_main/pharmacy.dart';
// import 'package:final_1/core/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

//   static Future<String> getID() async {
//     String id;
//     getCurrentFirebaseUser().then((info) {
//       User user = new User(
//         firstName: info.displayName,
//         userID: info.uid,
//         email: info.email ?? '',
//         profilePictureURL: info.photoUrl ?? '',
//       );
//       id = user.userID;
//     });
//     return id;
//   }

  static Future<void> signOut() async {
    FacebookLogin.channel.invokeMethod("logOut");
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

  static Future<QuerySnapshot> getChatRoom() async {
    print('asdfasdf');

    FirebaseUser user = await Auth.getCurrentUser();
    print(user.displayName);
    return Firestore.instance
        .collection("chats")
        .where("members", arrayContains: user.displayName)
        .getDocuments();
  }

  static Future<QuerySnapshot> getChatRoom2() async {
    print('asdfasdf222');

    FirebaseUser user = await Auth.getCurrentUser();
    print(user.displayName);
    return Firestore.instance
        .collection("chats")
        .where("members", arrayContains: 'Nhà thuốc tây Phước Thiện 5')
        .getDocuments();
  }

  static Future<void> addroom(FirebaseUser user) async {
    return Firestore.instance
        .collection("chats")
        .where("members", arrayContains: user.displayName)
        .getDocuments();
  }

  Future<QuerySnapshot> findExistedChatRoom2(String id1, String id2) async {
    return await Firestore.instance.collection("chats").where("members",
        isEqualTo: [id1, 'Nhà thuốc tây Phước Thiện 5']).getDocuments();
  }

  Future<QuerySnapshot> findExistedChatRoom(String id1, String id2) async {
    return await Firestore.instance
        .collection("chats")
        .where("members", isEqualTo: [id1, id2]).getDocuments();
  }

  static Future<List<Pharmacy>> getpharmacies() async {
    final response = await http
        .get('http://ezhealthcare.luisnguyen.com/api/v1/mobile/get/pharmacies');
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      // print(data.toString());
      return PharmaciesList.fromJson(data).data;
    } else {
      print("api error");
      throw Exception('Failed to load post');
    }
  }

  static Future<String> getToken() async {
    var fbLogin = FacebookLogin();
    FacebookLoginResult result;
    try {
      result =
          await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          var accessToken = result.accessToken;
          print(
              '==============================================================================');
          print(accessToken.token);
          return accessToken.token;

          break;
        case FacebookLoginStatus.cancelledByUser:
        //   throw ErrorHint("CANCEL_BY_USER");
        //   break;
        case FacebookLoginStatus.error:
          //   throw ErrorHint("UNKNOWN ERROR");
          break;
      }
    } catch (error) {
      //   throw ErrorHint(error.code);
    }
  }

 

  static Future<void> loginWithFacebook2(context) async {
    var fbLogin = FacebookLogin();
    FacebookLoginResult result;
    try {
      result =
          await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          var accessToken = result.accessToken;
          print(
              '==============================================================================22');
          print(accessToken.token);

          //   FirebaseAuth.instance.currentUser().then((firebaseUser) {
          //     User user = new User(
          //       firstName: firebaseUser.displayName,
          //       userID: firebaseUser.uid,
          //       email: firebaseUser.email ?? '',
          //       profilePictureURL: firebaseUser.photoUrl ?? '',
          //     );
          //     Auth.addUser(user);
          //     if (firebaseUser.displayName == 'BK Lập') {
          // 		print('1--------------------------------------');
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => PharmacyMessage(),
          //         ),
          //       );
          //     } else {
          // 		print('2--------------------------------------');
          //      Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => RootScreen(),
          //         ),
          //       );
          //     }
          //   });
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

  static getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

//   static Stream<User> getUser(String userID) {
//     return Firestore.instance
//         .collection("users")
//         .where("userID", isEqualTo: userID)
//         .snapshots()
//         .map((QuerySnapshot snapshot) {
//       return snapshot.documents.map((doc) {
//         return User.fromDocument(doc);
//       }).first;
//     });
//   }

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

  Future<void> loginWithFacebook1(context) async {
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
