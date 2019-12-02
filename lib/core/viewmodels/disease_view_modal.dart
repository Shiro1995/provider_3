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

  void getDisease() {
    _listDisease = [
      Disease(
        classify: 'Hô hấp',
        decrible:
            'Ngưng thở khi ngủ trung ương có thể xảy ra như là kết quả của các điều kiện khác, chẳng hạn như suy tim và đột quỵ, ngủ ở một độ cao cũng có thể gây ngưng thở khi ngủ trung ương',
        name: 'Ngưng thở khi ngủ trung ương',
      ),
      Disease(
        classify: 'Tim Mạch',
        decrible:
            'Viêm tiểu phế quản nặng có thể gây thở khó khăn đáng kể, da xanh, một dấu hiệu oxy không đầy đủ, Điều này đòi hỏi chăm sóc y tế khẩn cấp',
        name: 'Viêm tiểu phế quản',
      ),
      Disease(
        classify: 'Tiêu Hóa và Tụy',
        decrible:
            'Các điều kiện khác bên cạnh xẹp phổi có thể gây ra khó thở, và hầu hết yêu cầu chẩn đoán chính xác và điều trị kịp thời',
        name: 'Xẹp phổi',
      )
    ];

    notifyListeners();
  }

  Future<Disease> fetchPost() async {
    final response = await http
        .get('https://luisnguyen.com/api/v1/application/construction/config');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Disease.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

