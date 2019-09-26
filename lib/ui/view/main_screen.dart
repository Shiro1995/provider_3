// import 'package:finalproject_healthcare/business/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_1/core/constant/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:finalproject_healthcare/models/user.dart';
import 'package:final_1/core/model/user.dart';
import 'package:final_1/core/services/Auth.dart';

class MainScreen extends StatefulWidget {
  final FirebaseUser firebaseUser;

  MainScreen({this.firebaseUser});

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  VoidCallback onBackPress;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onBackPress,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(
            elevation: 0.5,
            leading: new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
            title: Text("Home"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: Text('Log Out'),
                  onTap: () {
                    // Navigator.of(context).pushNamed(RoutePaths.Root);
					_logOut();
                  },
                ),
              ],
            ),
          ),
          body: StreamBuilder(
            stream: Auth.getUser(widget.firebaseUser.uid),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(212, 20, 15, 1.0),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: CircleAvatar(
                          backgroundImage: (snapshot.data.profilePictureURL !=
                                  '')
                              ? NetworkImage(snapshot.data.profilePictureURL)
                              : AssetImage("assets/images/default.png"),
                        ),
                      ),
                      Text("Name: ${snapshot.data.firstName}"),
                      Text("Email: ${snapshot.data.email}"),
                      Text("UID: ${snapshot.data.userID}"),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }

  void _logOut() async {
    Auth.signOut();
  }
}
