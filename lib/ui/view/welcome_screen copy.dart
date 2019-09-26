import 'package:final_1/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:final_1/ui/widgets/custom_flat_button.dart';

class WelcomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Icon(
              Icons.phone_iphone,
              color: Color.fromARGB(255, 20, 175, 135),
              size: 125.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
            child: Text(
              "Hello!",
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
          SizedBox(
            height: 50,
          ),
          //   Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Text(
          //       "You've just saved a week of development and headaches.",
          //       softWrap: true,
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: Colors.black,
          //         decoration: TextDecoration.none,
          //         fontSize: 15.0,
          //         fontWeight: FontWeight.w300,
          //         fontFamily: "OpenSans",
          //       ),
          //     ),
          //   ),
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
              borderColor: Color.fromRGBO(212, 20, 15, 1.0),
              borderWidth: 0,
              color: Color.fromARGB(255, 20, 175, 135),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Sign Up",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.black54,
              onPressed: () {
                Navigator.of(context).pushNamed("/signup");
              },
              splashColor: Colors.black12,
              borderColor: Colors.black12,
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
