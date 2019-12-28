import 'package:final_1/core/viewmodels/user_model.dart';
import 'package:final_1/ui/view/main_view/tab_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'welcome_screen.dart';

class RootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, snapshot, _) {
        if (snapshot.post != null) {
          print('co data');
          return new TabBarComponent();
        } else {
          print('khong co data');
          return WelcomeScreen();
        }
        // return new TabBarComponent();
      },
    );
  }

//   void _getUserInfo(FirebaseUser user) async {
//     UserProvider _userProvider = Provider.of<UserProvider>(context);
//     await _userProvider.getInfo(user);
//   }
}
