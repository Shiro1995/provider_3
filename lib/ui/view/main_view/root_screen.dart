import 'package:final_1/core/viewmodels/user_model.dart';
import 'package:final_1/ui/view/main_view/home_screen.dart';
import 'package:final_1/ui/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new Container(
            color: Colors.white,
          );
        } else {
          if (snapshot.hasData) {
          print(snapshot.data);
            return new HomeScreen();
          } else {
            return WelcomeScreen();
          }
        }
      },
    );
  }

//   void _getUserInfo(FirebaseUser user) async {
//     UserProvider _userProvider = Provider.of<UserProvider>(context);
//     await _userProvider.getInfo(user);
//   }
}
