import 'package:final_1/core/model/disease.dart';
import 'package:flutter/material.dart';

const Color kColorYellowLittleBirds = Color.fromRGBO(255, 231, 78, 1.0);

class FilterComponent extends StatefulWidget {
   String level = '0';
  FilterComponent({
    this.level,
  });
//   const FilterComponent({Key key, this.level}) : super(key: key);
//   final List<CardType> selectedTypes = [];

  @override
  _FilterComponentState createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
//   _FilterComponentState({
//     this.level,
//   });
  String dropdownValue = 'One';
//   String level = '0';
  Widget _header() {
    return Container(
      height: 50,
      color: Color.fromARGB(255, 20, 175, 135),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          Container(width: 12.0),
          Text(
            'Type',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _factions() {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _factionItem('Disease', '1'),
          _factionItem('Classify','0'),
          //   _factionItem('Symtpom'),
        ],
      ),
    ]);
  }

  Widget _factionItem(String text, String level) {
	  bool isActived = widget.level == level;
    return Expanded(
      child: RawMaterialButton(
        child: Container(
          height: 70,
          color: isActived ? Colors.grey[300] : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(faction.icon()),
              Container(height: 5),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        onPressed: () {
			widget.level = level;
			print(widget.level);
          setState(() {});
		//   print('a:'+level.toString());
        },
      ),
    );
  }

  Widget _title({String title}) {
    return Container(
      height: 30,
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _header(),
                // _title(title: 'Factions:'),
                // _factions(),
                _title(title: 'Types:'),
                _factions(),
                Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // _types(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
