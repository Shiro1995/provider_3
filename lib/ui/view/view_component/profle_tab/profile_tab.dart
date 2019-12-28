import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/core/viewmodels/user_model.dart';
import 'package:final_1/ui/view/view_component/profle_tab/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildAboveSection(context),
          _buildInfo(context),
        ],
      ),
    );
  }

  _buildInfo(BuildContext context) {
    return Positioned(
      top: 250,
      left: 25,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('images/babysick.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildAboveSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Profile',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProfilePage(),
                    )),
                child: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage('images/doctor.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 40, bottom: 25),
          alignment: Alignment.topRight,
          child: Text(
            'Dinh Hai',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.phone),
            title: Text('0923423141'),
          ),
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.mail),
            title: Text('lapzoma1234@gmail.com'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 60, top: 60),
          alignment: Alignment.topRight,
          child: RaisedButton(
            color: Colors.green,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    // title: new Text("Alert Dialog title"),
                    content: new Text("Do you want to logout?"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("NO"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("YES"),
                        onPressed: () {
                          UserProvider _userProvider =
                              Provider.of<UserProvider>(context);
                          _userProvider.reset();
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(RoutePaths.Root);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Log out',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
        )
      ],
    );
  }
}

void _logOut() async {
  await Auth.signOut();
}
