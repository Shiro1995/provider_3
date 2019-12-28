import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/ui/view/view_component/second_main/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMessage extends StatefulWidget {
  @override
  _ListMessageState createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  Future pharmacy;

  void initState() {
    // print(pharmacy.toString() + 'hahsdfa');
    pharmacy = Auth.getChatRoom();
	// getlastmessage();
    super.initState();
  }
	
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<QuerySnapshot>(
          future: pharmacy,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.documents[0].data['members'][1]);
              print('da codata');
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    title: Text(
                      snapshot.data.documents[position].data['members'][1],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    leading: CircleAvatar(
                        //     backgroundImage: snapshot[position].data.imageStore != ''
                        //         ?
                        backgroundImage: NetworkImage(
                            'https://images.foody.vn/res/g91/906753/prof/s576x330/foody-upload-api-foody-mobile-untitled-2-190417150603.jpg')
                        //         : AssetImage("assets/images/default.png"),
                        ),
                    subtitle: Text('read'),
                    onTap: () async {
						
                      FirebaseUser user = await Auth.getCurrentFirebaseUser();
                      var id;
                      Auth()
                          .findExistedChatRoom(
                              user.displayName,
                              snapshot.data.documents[position].data['members']
                                  [1])
                          .then((v) {
                        if (v.documents.length > 0) {
                          print('yes');
                          print(v.documents.length);
                          {
                            for (var i = 0; i < v.documents.length; i++) {
                              print(i.toString() +
                                  'asda' +
                                  v.documents[i].data.toString());
                            }
                          }
                          id = v.documents.first.documentID;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  user: user,
                                  name: snapshot.data.documents[position]
                                      .data['members'][1],
                                  id: id.toString()),
                            ),
                          );
                        }
                      });
                    },
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
