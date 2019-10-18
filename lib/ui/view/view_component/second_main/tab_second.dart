import 'package:final_1/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double kSmallPadding = 7.0;
const double kPadding = 12.0;
const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

final TextStyle _kTextStyle = TextStyle(
  fontSize: 14.0,
  color: kColorGrayText,
);

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
			  centerTitle: true,
            // title: const Text('Tabbed AppBar'),
            title: Text(
              'Personal Healthcare',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.black38,
              ),
            ),
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

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;
  Widget _row() {
    return GestureDetector(
      onTap: () => {
        null,
      },
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Image.asset(
             "images/doctor.jpg"
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Bác sĩ đa khoa',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\n125 Hà Huy Tập',
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
    );
  }

  Widget _stack() {
    return Stack(
      children: <Widget>[
        _row(),
        // _date(),
      ],
    );
  }

  Widget _date() {
    DateTime _date = DateTime.now();
    final df = new DateFormat('dd-MM-yyyy ');
    String time = df.format(_date);
    return Positioned(
      right: kSmallPadding,
      bottom: kPadding,
      child: Text(
        time,
        style: TextStyle(
          fontSize: 12.0,
          color: kColorGrayText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int position) {
          return Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(bottom: 5),
            //   color: Colors.amberAccent,
            // elevation: 3.0,
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
            child: _stack(),
          );
        },
      ),
    );
  }

  void ontap(BuildContext context) {
    Navigator.of(context).pushNamed(RoutePaths.Map);
  }
}
