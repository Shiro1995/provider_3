import 'dart:convert';

import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/core/model/pharmacy.dart';
import 'package:final_1/ui/view/view_component/second_main/pharmacy.dart';
import 'package:final_1/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const double kSmallPadding = 7.0;
const double kPadding = 12.0;
const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

final TextStyle _kTextStyle = TextStyle(
  fontSize: 14.0,
  color: kColorGrayText,
);

Widget _searchField({BuildContext context}) {
  return SearchField(
      //   onChanged: (String text) {
      //     _onTextChanged(text: text);
      //   },
      //   onSubmitted: () {
      //     _onTextSubmitted(context: context);
      //   },
      );
}

class TabbedAppBarSample extends StatefulWidget {
  @override
  _TabbedAppBarSampleState createState() => _TabbedAppBarSampleState();
}

class _TabbedAppBarSampleState extends State<TabbedAppBarSample> {
  // @override
  // void initState() {
  //   print('hello');
  //   Future.delayed(Duration.zero,
  //       () => Provider.of<PharmacyViewModel>(context).getpharmacies());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // title: const Text('Tabbed AppBar'),
            title: _searchField(),
            // Text(
            //   'Personal Healthcare',
            //   maxLines: 1,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontFamily: 'Montserrat',
            //     fontWeight: FontWeight.bold,
            //     fontSize: 23,
            //     color: Colors.yellow[200],
            //   ),
            // ),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
            backgroundColor: Color.fromARGB(255, 20, 175, 135),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Doctor', icon: Icons.person),
  const Choice(title: 'Pharmacy', icon: Icons.store)
//   const Choice(title: 'BOAT', icon: Icons.directions_boat),
//   const Choice(title: 'BUS', icon: Icons.directions_bus),
//   const Choice(title: 'TRAIN', icon: Icons.directions_railway),
//   const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatefulWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

Future<List<Pharmacy>> getpharmacies() async {
	print("ahih");
  final response = await http
      .get('http://ezhealthcare.luisnguyen.com/api/v1/mobile/get/pharmacies');

  if (response.statusCode == 200) {
	  dynamic data = json.decode(response.body);
	//   print("data: "+data.toString());
    // If server returns an OK response, parse the JSON.
    // List<dynamic> list = json.decode(response.body)["data"]["pharmacies"];
    return PharmaciesList.fromJson(data).data;	
  } else {
	  print("api error");
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class _ChoiceCardState extends State<ChoiceCard> {
  Future pharmacy;
  @override
  void initState() {
print('haiaiaia');
    pharmacy = getpharmacies();
       super.initState();
    print(pharmacy);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Pharmacy>>(
          future: getpharmacies(),
          builder: (context, snapshot) {
			  if (snapshot.hasData)
            return Scaffold(
              body: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Phamarcy())),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(bottom: 5),
                        height: 120,
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
                              height: 100.0,
                              width: 100.0,
                              child: CircleAvatar(
                                backgroundImage:
								snapshot.data[position].imageStore !=''?
										NetworkImage('https://images.foody.vn/res/g91/906753/prof/s576x330/foody-upload-api-foody-mobile-untitled-2-190417150603.jpg'):
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
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[position].address,
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

  void ontap(BuildContext context) {
    Navigator.of(context).pushNamed(RoutePaths.Phamarcy);
  }
}
