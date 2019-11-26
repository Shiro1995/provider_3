import 'package:final_1/ui/view/view_component/second_main/tab_second.dart';
import 'package:final_1/ui/view/view_component/tab_fourth.dart';
import 'package:final_1/ui/view/view_component/tabs_third.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_1/ui/view/view_component/first_main/tabs_first.dart';

class HomeScreen extends StatefulWidget {
 

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
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  Widget appBarTitle = new Text("Personal Healthcare");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar

      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          FirstTab(),
          TabbedAppBarSample(),
          ThirdTab(),
          FourthTab(),
        ],
        // set the controller
        controller: controller,
      ),

      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Color.fromARGB(250, 20, 175, 135),
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.assignment_return),
            ),
            Tab(
              icon: Icon(Icons.location_on),
            ),
            Tab(icon: Icon(Icons.person))
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
