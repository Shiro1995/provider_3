import 'package:final_1/core/model/disease.dart';
import 'package:final_1/core/viewmodels/disease_view_modal.dart';
import 'package:final_1/ui/view/view_component/first_main/search.dart';
import 'package:final_1/ui/view/view_component/first_main/symptom/symptom_screen1.dart';
import 'package:final_1/ui/widgets/search_field.dart';
import 'package:final_1/ui/widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';

import 'disease_list_screen.dart';
import 'disease_screen.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  String _query;
  bool _isKeyboardVisible = false;
  FilterComponent _filterComponent = FilterComponent();
  final TextEditingController _controller = new TextEditingController();
  DiseaseViewModel viewModel = new DiseaseViewModel();
  String level = '0';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => Provider.of<DiseaseViewModel>(context).getDiseases());
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      },
    );
  }

  void _onTextChanged({String text}) {
    _query = text;
    Provider.of<DiseaseViewModel>(context).queryDisease(_query, level);
    setState(() {});
  }

  Widget _searchField({BuildContext context}) {
    return SearchField(
      controller: _controller,
      onChanged: (String text) {
        _onTextChanged(text: text);
      },
      //   onSubmitted: () {
      //     _onTextSubmitted(context: context);
      //   },
    );
  }

  void _onPackSelected({BuildContext context, Disease disease}) async {
    //   Provider.of<DiseaseViewModel>(context).getDiseases(type);
    bool isType;
    if (level == '0')
      isType = true;
    else
      isType = false;
    await Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return isType
              ? DiseasePage(
                  disease: disease,
                  title: disease.name,
                )
              : ShowPage(
                  title: disease.name,
                );
        },
      ),
    );
  }

  Widget _filterButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        _showFilterWidget(context);
      },
    );
  }

  void _showFilterWidget(BuildContext context) {
    Future<Disease> future = showModalBottomSheet(
      context: context,
      builder: (context) {
        return _filterComponent;
      },
      isScrollControlled: true,
    );

    future.then((value) {
      if (_filterComponent.level[0] != null) {
        level = _filterComponent.level[0];
      } else {
        level = '0';
      }
      Provider.of<DiseaseViewModel>(context).queryDisease(_query, level);
      setState(() {});
      //   _filter.factions = _filterComponent.selectedFactions;
      //   _filter.types = _filterComponent.selectedTypes;
    });
  }

  Widget _body(context) {
    print(_query);
    return Consumer<DiseaseViewModel>(builder: (context, _diseaseViewModel, _) {
      if (_diseaseViewModel.type.length > 0) {
        return Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListView.separated(
            itemCount: _diseaseViewModel.type.length,
            itemBuilder: (BuildContext context, int index) {
              Disease disease = _diseaseViewModel.type[index];
              return DiseaseList(
                  disease: disease,
                  index: index,
                  onTap: () {
                    _onPackSelected(context: context, disease: disease);
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return Separator(1);
            },
          ),
        );
      } else
        return CircularProgressIndicator();
    });
  }

  Widget _cancelButton() {
    return RawMaterialButton(
      child: Text(
        'Cancel',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      onPressed: () {
        _controller.clear();
        _query = null;
        setState(() {});
        Provider.of<DiseaseViewModel>(context).queryDisease(_query, level);
        FocusScope.of(context).requestFocus(new FocusNode());
      },
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
        actions: <Widget>[
          _isKeyboardVisible ? _cancelButton() : _filterButton(context),
        ],
      ),
      body: Center(
        child: _body(context),
      ),
      //   floatingActionButton: Padding(
      //     padding: EdgeInsets.only(bottom: 50.0),
      //     child: FloatingActionButton(
      //       onPressed: () {
      //         // Add your onPressed code here!
      //       },
      //       child: Icon(Icons.search),
      //       backgroundColor: Color.fromARGB(255, 20, 175, 135),
      //     ),
      //   ),
    );
  }
}
