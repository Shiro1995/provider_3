import 'package:final_1/core/model/disease.dart';
import 'package:final_1/ui/view/view_component/first_main/symptom/symptom_list_item.dart';
import 'package:flutter/material.dart';

class DiseasePage extends StatefulWidget {
  DiseasePage({
    Key key,
    @required this.title,
    @required this.disease,
  }) : assert(title != null, disease != null);
  final Disease disease;
  final String title;

  @override
  _DiseasePageState createState() => _DiseasePageState(disease: disease);
}

class _DiseasePageState extends State<DiseasePage> {
  _DiseasePageState({
    @required this.disease,
  }) : assert(disease != null);
  final Disease disease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 20, 175, 135),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
            ),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SymptomList(
            onTap: () {},
            disease: disease,
          ),
        ));
  }
}
