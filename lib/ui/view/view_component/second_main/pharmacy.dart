import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/ui/view/view_component/second_main/chat.dart';
import 'package:final_1/ui/view/view_component/tabs_third.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Item(String text, String number) {
  return Column(
    children: <Widget>[
      Text(number),
      SizedBox(
        height: 5,
      ),
      Text(text),
    ],
  );
}

void _onPackSelected({BuildContext context}) async {
  //   Provider.of<DiseaseViewModel>(context).getDiseases(type);
  // Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => Phamarcy())),
//   await Navigator.push(
//     context,
//     CupertinoPageRoute(
//       fullscreenDialog: true,
//       builder: (BuildContext context) {
//         return ThirdTab(
//         //   disease: disease,
//         //   title: disease.name,
//         );
//       },
//     ),
//   );
}

class Phamarcy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
          backgroundColor: Color.fromARGB(255, 20, 175, 135),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/tiembanthuoc.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Thuốc tây Phương Anh',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Separator(1),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Item('bình luận', '10'),
                    Item('check in', '5'),
                    Center(
                      child: Container(
                          height: 34,
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "  5.7  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Separator(1),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'OPEN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.green[300],
                            ),
                          ),
                        ),
                        Text('7:00-23:00'),
                      ],
                    ),
                    RawMaterialButton(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        height: 40,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.phone),
                              Text(
                                'Liên hệ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  //   color: Colors.green[300],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onPressed: null,
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () async {
                        FirebaseUser user = await Auth.getCurrentFirebaseUser();
						print(user);
                        await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return ChatScreen(user: user

                                  //   disease: disease,
                                  //   title: disease.name,
                                  );
                            },
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on),
                      // color: Colors.black,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return ThirdTab(

                                  //   disease: disease,
                                  //   title: disease.name,
                                  );
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Separator(10),
            ],
          ),
        ));
  }
}
