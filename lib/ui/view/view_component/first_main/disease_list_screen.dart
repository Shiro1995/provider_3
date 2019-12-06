import 'package:final_1/core/model/disease.dart';
import 'package:final_1/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// final TextStyle _kTextStyle = TextStyle(
//   fontSize: 14.0,
//   color: kColorGrayText,
// );

class DiseaseList extends StatelessWidget {
  DiseaseList({
    Key key,
    @required this.disease,
    @required this.index,
    @required this.onTap,
  })  : assert(disease != null),
        assert(index != null),
        super(key: key);

  final Disease disease;
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
          disease.name,
          style: _textStyleName,
		overflow: TextOverflow.ellipsis,	
        ),
		
      ),
    );
  }

  Widget _widgetText(String text) {
    // String decrip;
    // if (text.length > 40) {
    //   decrip = text.substring(0, 50);
    // } else {
    //   decrip = text;
    // }
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Text(
          text.substring(0,45)+'...',
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
      height:65.0,
      child: RawMaterialButton(
          onPressed: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _widgetName(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _widgetText(disease.description),
                    //  _widgetText('50 disease'),
                  ]),
            ],
          )),
    );
  }
}
