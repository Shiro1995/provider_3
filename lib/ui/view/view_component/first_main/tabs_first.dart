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

class FirstTab extends StatefulWidget {
//   FirstTab({this.viewmodel});
//   DiseaseViewModel viewmodel;
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  Widget _row() {
    return GestureDetector(
      onTap: _onTap,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Image.asset(
              "images/babysick.jpg",
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                children: <Widget>[
                  Text(
                    'Dấu hiệu ở trẻ em',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\nCác triệu chứng xuất hiện từ 5 tháng tuổi đến 5 tuổi',
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
        _date(),
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

  _onTap() {
    Navigator.of(context).pushNamed(RoutePaths.Sysptomt1);
  }

  Widget appBarTitle = new Text("Personal Healthcare");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // Title

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
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black38,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                } else {
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text("Personal Healthcar");
                }
              });
            },
          ),
        ],

        // title: Text("Using Bottom Navigation Bar"),
        backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
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
}
//   child: ListTile(
//     leading: Image.asset("images/babysick.jpg"),
//     title: Text(
//       'Tre em',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 27,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     subtitle: Text(
//       'Kiểm tra dấu hiệu nguy hiểm' +
//           'toàn thân\nHỏi 4 triệu chứng chính\nKiểm tra bệnh tay chân miệng \nKiểm tra dinh dưỡng và thiếu máu\nĐiều trị cấp cứu trước khi' +
//           'chuyển viện và điều trị đặc hiệu tại nhà',
//       // textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     ),
//   ),
//   return Container(
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(0.0, 15.0),
//             blurRadius: 15.0,
//           ),
//         ]),
//     child: Row(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(
//             left: kSmallPadding,
//             top: kPadding,
//             bottom: kPadding,
//           ),
//           child: Container(
//             height: 120,
//             //   width: 100,
//             child: Image.asset(
//               "images/babysick.jpg",
//               fit: BoxFit.scaleDown,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(kSmallPadding),
//             child: Column(
//               children: <Widget>[
//                 Text(
//                   'Trieu chung o tre em',
//                   maxLines: 3,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
