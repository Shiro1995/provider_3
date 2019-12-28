import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/ui/widgets/custom_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SendMedicine extends StatefulWidget {
  @override
  _SendMedicineState createState() => _SendMedicineState();
}

class _SendMedicineState extends State<SendMedicine> {
  String dropdownValue = 'One';
  TextEditingController myController = new TextEditingController();
  InputBorder _border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    );
  }

  textfield(String text) {
    return Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 5, bottom: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          //   controller: myController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Medicine'),
        backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70, left: 10, right: 10),
            height: 500,
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
          ),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Medicine record',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25.0, bottom: 10.0, left: 35.0, right: 50.0),
                child: textfield('Name of disease'),
              ),

              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  'Medicine',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 5.0, bottom: 10.0, left: 35.0, right: 50.0),
                child: textfield('Name'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 35.0, right: 50.0),
                child: textfield('Number'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 35.0, right: 50.0),
                child: textfield('Dose'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
                child: CustomFlatButton(
                  title: "Send",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  borderColor: Colors.black12,
                  borderWidth: 2,
                  color: Color.fromARGB(255, 20, 175, 135),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // title: new Text("Alert Dialog title"),
                          content: new Text("Send Bill?"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("NO"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("YES"),
                              onPressed: () {
								  Toast.show("Success!", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              //   Padding(
              //     padding: EdgeInsets.only(
              //         top: 5.0, bottom: 10.0, left: 20.0, right: 50.0),
              //     child: textfield('medicine'),
              //   ),
            ],
          ),
        ],
      ),
    );
  }
}
