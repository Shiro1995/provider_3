import 'package:final_1/core/model/pharmacy.dart';
import 'package:final_1/core/services/api.dart';
import 'package:flutter/cupertino.dart';

class PharmacyViewModel extends ChangeNotifier{
	 List<Pharmacy> _listDisease = [];
Api _api;
  List get phamacies => _listDisease;
  void reset() {
    _listDisease = [];
    notifyListeners();
  }

  Future<void> getpharmacies() async {
      _listDisease = await _api.getpharmacies();
	  print("_listDisease"+_listDisease.toString());
	  notifyListeners();	
  }

}