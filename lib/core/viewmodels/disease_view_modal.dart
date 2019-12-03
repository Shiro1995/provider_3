import 'dart:convert';

import 'package:final_1/core/model/disease.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DiseaseViewModel extends ChangeNotifier {
  List<Disease> _listDisease = [];

  List get disease => _listDisease;

  void reset() {
    _listDisease = [];
    notifyListeners();
  }

  Future<void> getdiseases() async {
    print("getdiseases");
    dynamic response = await http
        .get('https://ezhealthcare.luisnguyen.com/api/v1/mobile/get/diseases');

    print("111");

    if (response.statusCode == 200) {
      print("halo222");
      dynamic data = json.decode(response.body);
      print("data: " + data['data'].toString());
      // If server returns an OK response, parse the JSON.
      // List<dynamic> list = json.decode(response.body)["data"]["pharmacies"];
      _listDisease = Diseaselist.fromJson(data).data;
      notifyListeners();
    } else {
      print("api error");
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
