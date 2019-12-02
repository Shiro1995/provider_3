import 'package:flutter/material.dart';

const double kSmallPadding = 7.0;
const double kPadding = 12.0;
const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

// class ListSymptoms extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Symptom'),
//         key: Key('symptom'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => {
//             Navigator.of(context).pop(),
//           },
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverPersistentHeader(
//             delegate: _DeckHeaderDelegate(),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ListSymptoms extends StatelessWidget {
  _header() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              'Nhung dau hieu tre tu 5 thang den 5 tuoi',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(kPadding),
          //     child: Column(
          //       children: <Widget>[
          //         Text(
          //           'Dau Hieu O Tre Em',
          //           maxLines: 3,
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 16.0,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         Text(
          //           '\nCac trieu chung xuat hien o tre tu 5 thang tuoi den 5 tuoi',
          //           textAlign: TextAlign.center,
          //           style: _kTextStyle,
          //         ),
          //       ],
          //     ),
          //   ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom'),
        key: Key('symptom'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
		backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
      body: Container(
        child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _header(),
              //   _icon(),
              //   SizedBox(height: 5),
              //   _name(),
              //   SizedBox(height: 5),
              //   _faction(),
              //   SizedBox(height: 5),
              //   _info(),
            ]),
      ),
    );
  }
}
