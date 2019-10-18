import 'package:final_1/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
        automaticallyImplyLeading: false,
        // Title
        actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () => {
		// 		Navigator.of(context).pushNamed(RoutePaths.Search),
		// 	},
        //   )
        ],
        // title: Text("Using Bottom Navigation Bar"),
        backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
      body: Center(
        child: Text('search'),
      ),
    );
  }
}
