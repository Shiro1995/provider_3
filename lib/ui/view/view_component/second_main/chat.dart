import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final FirebaseUser user;
  final String name;
  final String id;

  const ChatScreen({Key key, this.user, this.name, this.id}) : super(key: key);
  _ChatScreenState createState() => _ChatScreenState(id: id);
}

class _ChatScreenState extends State<ChatScreen> {
  _ChatScreenState({
    @required this.id,
  }) : assert(
          id != null,
        );
   String id;

  final Firestore _firestore = Firestore.instance;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
void initState() {
    super.initState();
    print('id:'+id);
  }
  Future<void> callback() async {
    if (messageController.text.length > 0) {
      _firestore.collection('chats/' + id + '/' + id).add({
        'text':  messageController.text,
        'from': widget.user.email,
        'date': DateTime.now().toIso8601String().toString(),
      });
	  messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 20, 175, 135),
            title: Row(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3.0, color: Colors.grey[300]),
                      image: DecorationImage(
                          image: ExactAssetImage("assets/images/no-avatar.png"),
                          fit: BoxFit.cover)),
                ),
                Text(widget.name),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Text(widget.user.displayName+'+'+widget.name),
                //   ],
                // )
              ],
            )),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chats/' + id + '/' + id)
                      .orderBy('date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    List<DocumentSnapshot> docs = snapshot.data.documents;
                    print(docs);
                    List<Widget> messages = docs
                        .map((doc) => Message(
                              from: doc.data['from'],
                              text: doc.data['text'],
                              me: widget.user.email == doc.data['from'],
                            ))
                        .toList();

                    return ListView(
                      controller: scrollController,
                      children: <Widget>[
                        ...messages,
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 50.0,
                ),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) => callback(),
                          decoration: InputDecoration(
                            hintText: "Enter a Message...",
                            border: const OutlineInputBorder(),
                          ),
                          controller: messageController,
                        ),
                      ),
                      SendButton(
                        text: "Send",
                        callback: callback,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange,
      onPressed: callback,
      child: Text(text),
    );
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}
