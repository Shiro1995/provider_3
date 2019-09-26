// import 'package:finalproject_healthcare/business/auth.dart';
// import 'package:finalproject_healthcare/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_1/ui/widgets/custom_flat_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/ui/shared/ui_helpers.dart';

class WelcomeScreen extends StatelessWidget {
  final FirebaseUser firebaseUser;
  WelcomeScreen({this.firebaseUser});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Container(
                height: 100, child: Image.asset('images/medicine.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
            child: Text(
              "Welcome to Personal Healthcare!",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 20, 175, 135),
                decoration: TextDecoration.none,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "A system help us searching disease and contact with doctor or phamacy",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Log In",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(RoutePaths.Root);
              },
              splashColor: Colors.black12,
              borderColor: Color.fromRGBO(17, 156, 103, 1),
              borderWidth: 0,
              color: Color.fromARGB(255, 20, 175, 135),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "OR",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Sign in with Facebook",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                // loginWithFacebook(context);
                Auth.loginWithFacebook(context);
              },
              // splashColor: Colors.black12,
              borderColor: Colors.black12,
              borderWidth: 2,
              color: Color.fromRGBO(11, 55, 138, 30),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Sign in with Google",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(RoutePaths.Login);
              },
              // splashColor: Colors.black12,
              borderColor: Colors.black12,
              borderWidth: 2,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
