import 'package:final_1/ui/view/view_component/second_main/tab_second.dart';
import 'package:final_1/ui/view/view_component/tab_fourth.dart';
import 'package:final_1/ui/view/view_component/tabs_third.dart';
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
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    // controller.dispose();
    super.dispose();
  }

  Widget appBarTitle = new Text("Personal Healthcare");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          FirstTab(),
          TabbedAppBarSample(),
          ThirdTab(),
          FourthTab(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Color.fromARGB(250, 20, 175, 135),
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.assignment_return),
            ),
            Tab(
              icon: Icon(Icons.library_books),
            ),
            Tab(
              icon: Icon(Icons.location_on),
            ),
            Tab(icon: Icon(Icons.person))
          ],
          controller: controller,
        ),
      ),
    );
  }
}
