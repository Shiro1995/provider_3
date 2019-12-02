import 'dart:convert';
import 'package:final_1/core/model/pharmacy.dart';
import 'package:http/http.dart' as http;

class Api {
  static const endpoint = 'http://ezhealthcare.luisnguyen.com/';



  Future<List<Pharmacy>>getpharmacies() async{
	  List<Pharmacy> _list = [];
	final response =
      await http.get(endpoint+'api/v1/mobile/get/pharmacies');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
	 List<dynamic> list = json.decode(response.body);
	 List<Pharmacy> phamacies =  list.map((item) => Pharmacy.fromJson(item)).toList();
    return phamacies;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
  }
}
