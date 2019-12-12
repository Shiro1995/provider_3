import 'dart:convert';

import 'package:final_1/core/model/symptom.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class SymptomViewModel extends ChangeNotifier {

	Symptom symptoms ;

	 get symptom => symptoms;

	Future<void> getSymptoms() async {
    print("getsymptoms");
    dynamic response = await http
        .get('http://ezhealthcare.luisnguyen.com/api/v1/mobile/get/symptoms/25');

    if (response.statusCode == 200) {
	    dynamic data = json.decode(response.body);
    //   notifyListeners();
    //   print("data: " + data['data'].toString());

	print(data['data'].toString());
      var sortedDisease = SymptomList.fromJson(data).data;
    //   sortedDisease.sort((a, b) => a.name.compareTo(b.name));
      symptoms = sortedDisease;
      notifyListeners();
    } else {
      print("api error");
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}