import 'package:final_1/core/model/disease.dart';
import 'package:final_1/ui/view/view_component/first_main/symptom/symptom_screen.dart';
import 'package:final_1/ui/view/view_component/first_main/symptom/symptom_screen1.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SymptomList extends StatelessWidget {
  SymptomList({
    @required this.onTap,
    @required this.disease,
  });
  final Disease disease;
  final VoidCallback onTap;

  void _onPackSelected({BuildContext context, Disease disease}) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return ShowPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
	   disease.diseases.sort((a,b) => a.name.compareTo(b.name));
    return ListView.separated(
        itemCount: disease.diseases.length,
        itemBuilder: (BuildContext context, int index) {
          return SymptomPage(
              disease: disease,
              index: index,
              onTap: () {
                _onPackSelected(context: context, disease: disease);
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return Separator(1);
        });
    //   })
  }
}
