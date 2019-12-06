import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
	Separator(this.height);

	final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey[200],
    );
  }
}
