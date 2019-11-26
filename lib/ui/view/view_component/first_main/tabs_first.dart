import 'package:final_1/core/model/disease.dart';
import 'package:final_1/core/viewmodels/disease_view_modal.dart';
import 'package:final_1/ui/widgets/disease_list_screen.dart';
import 'package:final_1/ui/widgets/disease_screen.dart';
import 'package:final_1/ui/widgets/search_field.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double kSmallPadding = 7.0;
const double kPadding = 12.0;
const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

final TextStyle _kTextStyle = TextStyle(
  fontSize: 14.0,
  color: kColorGrayText,
);

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final DiseaseViewModel dsModal = DiseaseViewModel();

  @override
  void initState() {
	 Future.delayed(Duration.zero,()=>Provider.of<DiseaseViewModel>(context).getDisease());    
	 super.initState();
  }

  Widget _searchField({BuildContext context}) {
    return SearchField(
        //   onChanged: (String text) {
        //     _onTextChanged(text: text);
        //   },
        //   onSubmitted: () {
        //     _onTextSubmitted(context: context);
        //   },
        );
  }

  void _onPackSelected({BuildContext context, Disease disease}) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return DiseasePage(
            title: disease.classify,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 5.0,
          title: _searchField(context: context),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 20, 175, 135),
        ),
        body: Consumer<DiseaseViewModel>(builder: (context, _disease, _) {
		
			// return ListView.builder(
			// 	itemCount: 15,
			// 	itemBuilder: ( context,  index) {
			// 		return DiseaseList(
            //         disease: _disease.disease[index%3],
            //         index: index,
            //         onTap: () {
            //           _onPackSelected(context: context, disease: _disease.disease[index%3]);
            //         });
			// 	}
			// );
          return ListView.separated(
			    itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                final disease = _disease.disease[index%3];
                return DiseaseList(
                    disease: disease,
                    index: index,
                    onTap: () {
                      _onPackSelected(context: context, disease: disease);
                    });
              },
            
              separatorBuilder: (BuildContext context, int index) {
                return Separator();
              });
        })
		);
  }
}
