import 'package:final_1/core/model/symptom.dart';
import 'package:final_1/core/viewmodels/symptom_view_modal.dart';
import 'package:final_1/ui/view/view_component/first_main/symptoms_list.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:final_1/ui/widgets/symptom_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SymptomList extends StatefulWidget {
  SymptomList({
    @required this.onTap,
    symptom,
    int index,
  });

  final VoidCallback onTap;

  @override
  _SymptomListState createState() => _SymptomListState();
}

class _SymptomListState extends State<SymptomList> {
  @override
  void initState() {
    Future.delayed(Duration.zero,
        () => Provider.of<SymptomViewModel>(context).getSymptom());
    super.initState();
  }
  void _onPackSelected({BuildContext context, Symptom symptom}) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return ListSymptoms(
            
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SymptomViewModel>(builder: (context, _symptom, _) {
        return ListView.separated(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              final symptom = _symptom.symptom[index % 3];
              return SymptomPage(
				symptom: symptom, 
			  index: index, 
			  onTap: () {
				   _onPackSelected(context: context, symptom: symptom);
			  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return Separator();
            });
      });
    
  }
}
