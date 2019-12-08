import 'package:final_1/core/viewmodels/symptom_view_modal.dart';
import 'package:final_1/styles/styles.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowPage extends StatefulWidget {
// ShowPage({
//     @required this.title,
//   }) : assert(title != null);
// 	final String title;
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  List<bool> _moreConditions = [false, false, false, false, false];
 @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => Provider.of<SymptomViewModel>(context).getSymptoms());
  }

  List<String> title = [
    'Hiểu về bệnh',
    'Triệu chứng',
    'Nguyên nhân',
    'Yếu tố nguy cơ',
    'Biến chứng',
    'Xét nghiệm và chẩn đoán',
    'Phương pháp điều trị'
  ];

  Widget _widgetText(String text) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Text(
          text,
          maxLines: 20,
          style: TextStyle(
            fontSize: 18.0,
            // color: kColorGrayText,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget item(int index, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RawMaterialButton(
          onPressed: () => {
            _moreConditions[index] = !_moreConditions[index],
            setState(() {})
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '▶' + title[index],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          height: _moreConditions[index] ? 200.0 : 0.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListView.separated(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return _widgetText(text);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Separator(1);
              },
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
        title: Text('Symptom'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(255, 20, 175, 135),
      ),
      body: Consumer<SymptomViewModel>(builder: (context, _symptommodal, _) {
        if (_symptommodal.symptom != null) {
          return SingleChildScrollView(
					  child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                item(0, _symptommodal.symptoms.definitions[0].name),
                item(1,_symptommodal.symptoms.prognostics[0].name),
                item(2,''),
                item(3,''),
              ],
            ),
          );
        } else
          return CircularProgressIndicator();
      }),
    );
  }
}
