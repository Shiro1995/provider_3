import 'dart:convert';
import 'package:final_1/core/model/disease.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DiseaseViewModel extends ChangeNotifier {
  List<Disease> _listDisease = [];
 dynamic data;
  List get disease => _listDisease;
  void reset() {

    _listDisease = [];
    notifyListeners();
  }
	Future<void> queryDisease(String query){
		if(query==null || query == ''){
		 var sortedDisease = Diseaselist.fromJson(data).disease;
		sortedDisease.sort((a,b) => a.name.compareTo(b.name));
		_listDisease = sortedDisease;
      notifyListeners();
	} else{
		var sortedDisease = Diseaselist.fromJson(data).disease;
		List<Disease> disease2  = List<Disease>();
		sortedDisease.forEach((v){
				// disease2.addAll(v.diseases);
		print(v.diseases[0].name);	
		disease2.addAll(v.diseases);
		});
		print('hello22asdadad'+ disease2[0].name);
		_listDisease = getDiseasesWithQuery(query, disease2);
		// _listDisease = disease2;
		 notifyListeners();

	}
	}
	
 List<Disease> getDiseasesWithQuery(String query, List<Disease> diseases) {
    var newdiseases = diseases.where(
      (disease) {
        bool name = disease.name.toLowerCase().contains(query.toLowerCase());
        // bool traits = card.traits.toLowerCase().contains(query.toLowerCase());
        return name ;
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
      print("data: " + data['data'].toString());
	  var sortedDisease = Diseaselist.fromJson(data).disease;
		sortedDisease.sort((a,b) => a.name.compareTo(b.name));
		_listDisease = sortedDisease;
      notifyListeners();
    } else {
      print("api error");
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

}
