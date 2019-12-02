import 'package:flutter/material.dart';

class StorePharmacy extends StatelessWidget {
 


  static const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);


  @override
  Widget build(BuildContext context) {
    return Text('hello');
	// 	StreamBuilder(builder: (BuildContext context, snapshot) {
    //   if (snapshot.hasData) {
    //     return Container(
    //       margin: EdgeInsets.all(5.0),
    //       padding: EdgeInsets.only(bottom: 5),
    //       height: 100,
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(8.0),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black12,
    //               offset: Offset(0.0, 15.0),
    //               blurRadius: 15.0,
    //             ),
    //           ]),
    //       child: Row(
    //         children: <Widget>[
    //           Container(
    //             height: 100.0,
    //             width: 100.0,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: (snapshot.data.photoUrl != '')
    //                     ? NetworkImage(snapshot.data.photoUrl)
    //                     : AssetImage("assets/images/default.png"),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Padding(
    //               padding: const EdgeInsets.all(20),
    //               child: Column(
    //                 children: <Widget>[
    //                   Text(
    //                     snapshot.data.displayName,
    //                     maxLines: 3,
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       fontSize: 16.0,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   Text(
    //                     '\n125 Hà Huy Tập',
    //                     textAlign: TextAlign.center,
    //                     style: _kTextStyle,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           // _column(),
    //         ],
    //       ),
    //     );
    //   } else{
	// 	  return Text('loading');
	//   }
    // })
	
  }
}
