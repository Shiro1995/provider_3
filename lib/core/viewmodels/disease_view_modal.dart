import 'dart:convert';
import 'package:final_1/core/model/disease.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DiseaseViewModel extends ChangeNotifier {
  List<Disease> _listDisease = [];
  List<Disease> _listType = [];
  List<Disease> _listAll = [];
  dynamic data;
  List get disease => _listDisease;
  List get type => _listType;
  void reset() {
    _listDisease = [];
    notifyListeners();
  }

  Future<void> queryDisease(String query, String level) async {
    var disease2;
    if (query == null || query == '') {
      disease2 = _listAll;
    } else {
      disease2 = getDiseasesWithQuery(query, _listAll);
    }
    var newdiseases = disease2.where(
      (disease) {
        return disease.level == level;
      },
    ).toList();
    _listType = newdiseases;
    notifyListeners();
  }

  List<Disease> getDiseasesWithQuery(String query, List<Disease> diseases) {
    var newdiseases = diseases.where(
      (disease) {
        bool name = disease.name.toLowerCase().contains(query.toLowerCase());
        // bool traits = card.traits.toLowerCase().contains(query.toLowerCase());
        return name;
      },
    ).toList();
    return newdiseases;
  }

  Future<void> getDiseases() async {
    print("getdiseases");
    dynamic response = await http
        .get('https://ezhealthcare.luisnguyen.com/api/v1/mobile/get/diseases');

    print("111222");

    if (response.statusCode == 200) {
      data = json.decode(response.body);
      notifyListeners();
    
      var sortedDisease = Diseaselist.fromJson(data).disease;
      //   sortedDisease.sort((a, b) => a.name.compareTo(b.name));
    //   _listType = sortedDisease;
       _listAll.addAll(sortedDisease);
      sortedDisease.forEach((v) {
        _listAll.addAll(v.diseases);
      });
	  _listType = sortedDisease;
      notifyListeners();
    } else {
      print("api error");
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
