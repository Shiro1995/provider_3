import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_1/core/model/chat.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/ui/view/view_component/second_main/chat.dart';
import 'package:final_1/ui/view/view_component/tabs_third.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Widget item(String text, String number) {
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

void checkPharmacy(String id) async {
  final response = await http.get(
      'http://ezhealthcare.luisnguyen.com/api/v1/mobile/check/pharmacy' + id);
  if (response.statusCode == 200) {
    print('dug roi');
  } else {
    print("api error");
    throw Exception('Failed to load post');
  }
}

class PharmacyScreen extends StatelessWidget {
  PharmacyScreen({@required this.name, this.phone});
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
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
                  name,
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
                    item('bình luận', '10'),
                    item('check in', '5'),
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
                    GestureDetector(
                      onTap: () => _launchURL(),
                      child: RawMaterialButton(
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
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () async {
                        FirebaseUser user = await Auth.getCurrentFirebaseUser();
                        var id;
                        Auth()
                            .findExistedChatRoom(user.displayName, name)
                            .then((v) {
                          if (v.documents.length > 0) {
                            print('yes');
                            id = v.documents.first.documentID;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                    user: user, name: name, id: id.toString()),
                              ),
                            );
                          }
                          // });
                          else {
                            print('no');
                            Chat userroom = new Chat(user.displayName, name);
                            Firestore.instance
                                .collection('chats')
                                .add(userroom.toMap());
                          }
                        //   Firestore.instance
                        //       .collection('chats')
                        //       .where("members",
                        //           isEqualTo: [user.displayName, name])
                        //       .getDocuments()
                        //       .then((v) {
                        //         id = v.documents.first.documentID;
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => ChatScreen(
                        //                 user: user,
                        //                 name: name,
                        //                 id: id.toString()),
                        //           ),
                        //         );
                        //       });
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return ThirdTab();
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

  _launchURL() async {
    final url = 'tel:' + phone.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
