import 'package:final_1/ui/widgets/symptom_list_item.dart';
import 'package:flutter/material.dart';

class DiseasePage extends StatelessWidget {
  DiseasePage({
    Key key,
    @required this.title, 
  }) : assert(title != null);

  final String title;
   @override

//     void _onSymptomSelected({BuildContext context, symptom: Symptom}) {
 
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (BuildContext context) {
               
//       }),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
		 backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
      body: SymptomList(onTap: () {},),
    );
  }
}


