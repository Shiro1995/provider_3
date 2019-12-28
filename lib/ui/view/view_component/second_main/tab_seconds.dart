import 'package:final_1/core/model/pharmacy.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/ui/view/view_component/second_main/list_message.dart';
import 'package:final_1/ui/view/view_component/second_main/pharmacy.dart';
import 'package:flutter/material.dart';

final TextStyle _kTextStyle = TextStyle(
  fontSize: 14.0,
  color: kColorGrayText,
);
const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

class TabSeconds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Personal Healthcare',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.yellow[200],
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.store),
                text: 'Pharmacy',
              ),
              Tab(
                text: 'Message',
                icon: Icon(Icons.message),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 20, 175, 135),
        ),
        body: TabBarView(
          children: <Widget>[
            ChoiceCard(),
            ListMessage(),
          ],
        ),
      ),
    );
  }
}

class ChoiceCard extends StatefulWidget {
  const ChoiceCard({
    Key key,
  }) : super(key: key);

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  Future pharmacy;

  @override
  void initState() {
    pharmacy = Auth.getpharmacies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Pharmacy>>(
          future: pharmacy,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Scaffold(
                body: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int position) {
                    return GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return PharmacyScreen(
                                  name: snapshot.data[position].name,
                                  phone: snapshot.data[position].phoneNumber,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(bottom: 5),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 15.0),
                                  blurRadius: 15.0,
                                ),
                              ]),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 70.0,
                                width: 70.0,
                                child: CircleAvatar(
                                  backgroundImage: snapshot
                                              .data[position].imageStore !=
                                          ''
                                      ? NetworkImage(
                                          'https://images.foody.vn/res/g91/906753/prof/s576x330/foody-upload-api-foody-mobile-untitled-2-190417150603.jpg')
                                      :
                                      //  (snapshot.data.photoUrl != '')
                                      //     ? NetworkImage(snapshot.data.photoUrl)
                                      //     :
                                      AssetImage("assets/images/default.png"),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[position].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[position].address,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: _kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // _column(),
                            ],
                          ),
                        ));
                  },
                ),
              );
            return CircularProgressIndicator();
          }),
    );
  }
}