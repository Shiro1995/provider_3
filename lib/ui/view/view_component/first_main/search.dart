import 'package:final_1/core/model/disease.dart';
import 'package:flutter/material.dart';

const Color kColorYellowLittleBirds = Color.fromRGBO(255, 231, 78, 1.0);

class FilterComponent extends StatefulWidget {

  final String level = '';
//   final List<CardType> selectedTypes = [];

  @override
  _FilterComponentState createState() => _FilterComponentState(level: level);
}

class _FilterComponentState extends State<FilterComponent> {
	_FilterComponentState({
		this.level,
	});
	String level;
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

//   Widget _factionItem({Faction faction}) {
//     bool isSelected = widget.selectedFactions.contains(faction);
//     return Expanded(
//       child: RawMaterialButton(
//         child: Container(
//           height: 70,
//           color: isSelected ? Colors.grey[300] : Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(faction.icon()),
//               Container(height: 5),
//               Text(
//                 faction.toString(),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//         onPressed: () {
//           if (isSelected) {
//             widget.selectedFactions.remove(faction);
//           } else {
//             widget.selectedFactions.add(faction);
//           }
//           setState(() {});
//         },
//       ),
//     );
//   }

//   Widget _factions() {
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             _factionItem(faction: Faction.values[0]),
//             _factionItem(faction: Faction.values[1]),
//             _factionItem(faction: Faction.values[2]),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             _factionItem(faction: Faction.values[3]),
//             _factionItem(faction: Faction.values[4]),
//             _factionItem(faction: Faction.values[5]),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             _factionItem(faction: Faction.values[6]),
//             _factionItem(faction: Faction.values[7]),
//             _factionItem(faction: Faction.values[8]),
//           ],
//         ),
//       ],
//     );
//   }

  Widget _typeItem(String type) {
    bool isSelected = widget.level.contains(type);
    return Expanded(
      child: RawMaterialButton(
        child: Container(
          height: 50,
          color: isSelected ? Colors.grey[300] : Colors.white,
          child: Center(
            child: Text(
              type,
            ),
          ),
        ),
        onPressed: () {
          if (isSelected) {
          level = type;
          } else {
           
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _types() {
    List<Disease> types = [];
    // types.addAll(CardType.values);
    // types.remove(CardType.unknown);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _typeItem('1'),
        _typeItem('2'),
        _typeItem('3'),
      ],
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
                _types(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
