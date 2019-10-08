import 'package:final_1/styles/styles.dart';
import 'package:flutter/material.dart';

class GradientBg extends StatefulWidget {
  @override
  _GradientBgState createState() => _GradientBgState();
}

class _GradientBgState extends State<GradientBg> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage("lib/assets/bgs/bg-signup.png"),
          fit: BoxFit.cover,
          height: screenHeight(context),
          width: screenWidth(context),
        ),
        Image(
          image: AssetImage("lib/assets/bgs/bg-gradient.png"),
          fit: BoxFit.cover,
          height: screenHeight(context),
          width: screenWidth(context),
        ),
      ],
    );
  }
}
