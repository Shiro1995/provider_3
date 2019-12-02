import 'package:final_1/ui/widgets/custom_flat_button.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:flutter/material.dart';

class Phamarcy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
          backgroundColor: Color.fromARGB(255, 20, 175, 135),
        ),
        body: Column(
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
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                'Thuốc tây Phương Anh',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Separator(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
				  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'OPEN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.green[300],
                        ),
                      ),
					  Text('7:00-23:00'),
                    ],
                  ),
				  CustomFlatButton(
					  
				  ),
                ],
              ),
            ),
          ],
        ));
  }
}
