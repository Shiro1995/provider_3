import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {

ShowPage({
    @required this.title, 
  }) : assert(title != null);
	final String title;

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  appBar: AppBar(
        title: Text(title),
		 backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
	);
  }
}