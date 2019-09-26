import 'package:final_1/core/services/Auth.dart';
import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _logOut,
                child: Icon(
                  Icons.adb,
                  size: 160.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "Click here to logout",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _logOut() async {
    Auth.signOut();
  }
}
