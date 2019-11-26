import 'package:final_1/core/model/disease.dart';
import 'package:final_1/core/model/symptom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double kSmallPadding = 7.0;
const double kPadding = 12.0;
const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

final TextStyle _kTextStyle = TextStyle(
  fontSize: 14.0,
  color: kColorGrayText,
);

class SymptomPage extends StatelessWidget {
  SymptomPage({
    Key key,
    @required this.symptom,
    @required this.index,
    @required this.onTap,
  })  : assert(symptom != null),
        assert(index != null),
        super(key: key);

  final Symptom symptom;
  final int index;
  final VoidCallback onTap;
  final TextStyle _textStyleName = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  Widget _widgetName() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        child: Text(
          symptom.name,
          style: _textStyleName,
        ),
      ),
    );
  }

  Widget _widgetText(String text) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: kColorGrayText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: RawMaterialButton(
          onPressed: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _widgetName(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _widgetText(symptom.decrible),
                  ]),
            ],
          )),
    );
  }
}
