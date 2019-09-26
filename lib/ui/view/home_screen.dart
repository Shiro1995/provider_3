import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/ui/view/view_component/tabs_second.dart';
import 'package:final_1/ui/view/view_component/tabs_third.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:using_bottom_nav_bar/tabs/second.dart';
// import 'package:using_bottom_nav_bar/tabs/third.dart';
import 'package:final_1/ui/view/view_component/tabs_first.dart';

void main() {
  runApp(MaterialApp(
      // Title
      title: "Using Tabs",
      // Home
      home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  final FirebaseUser firebaseUser;

  HomeScreen({this.firebaseUser});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// SingleTickerProviderStateMixin is used for animation
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
		  automaticallyImplyLeading: false,
        // Title
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pushNamed(RoutePaths.Welcome),
          )
        ],
        title: Text("Using Bottom Navigation Bar"),
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          FirstTab(),
          SecondTab(),
          ThirdTab(),
        ],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.adb),
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
