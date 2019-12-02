import 'package:final_1/core/model/symptom.dart';
import 'package:flutter/cupertino.dart';
class SymptomViewModel extends ChangeNotifier {

	List<Symptom> _listSymptom = [];

	List get symptom => _listSymptom;
	void reset() {
		 _listSymptom = [];
		 	notifyListeners();
	}
	void getSymptom() {
		 _listSymptom = [
			 Symptom(
			decrible: 'Viêm màng phổi xảy ra như là một biến chứng của một loạt các điều kiện cơ bản',
			name: 'Viêm màng phổi (pleuritis)',
		),
		 Symptom(
			decrible: 'Điều kiện thông thường, viêm phế quản cấp tính thường phát triển từ nhiễm trùng đường hô hấp do lạnh hay vấn đề khác',
			name: 'Viêm phế quản',
		),
		Symptom(
			decrible: 'Khó thở, thở khò khè, tức ngực, giảm khả năng hoạt động thể chất, ho mãn tính, ăn kém và gầy, mệt mỏi',
			name: 'Khí phế thũng',
		),
		];
		// listDisease.add(new Disease(
		// 	classify: 'Hô hấp',
		// 	decrible: 'Ngưng thở khi ngủ trung ương có thể xảy ra như là kết quả của các điều kiện khác, chẳng hạn như suy tim và đột quỵ, ngủ ở một độ cao cũng có thể gây ngưng thở khi ngủ trung ương',
		// 	name: 'Ngưng thở khi ngủ trung ương',
		// ));
		// listDisease.add(new Disease(
		// 	classify: 'Hô hấp',
		// 	decrible: 'Viêm tiểu phế quản nặng có thể gây thở khó khăn đáng kể, da xanh, một dấu hiệu oxy không đầy đủ, Điều này đòi hỏi chăm sóc y tế khẩn cấp',
		// 	name: 'Viêm tiểu phế quản',
		// ));
		// listDisease.add(new Disease(
		// 	classify: 'Xẹp phổi',
		// 	decrible: 'Các điều kiện khác bên cạnh xẹp phổi có thể gây ra khó thở, và hầu hết yêu cầu chẩn đoán chính xác và điều trị kịp thời',
		// 	name: 'Xẹp phổi',
		// ));
		notifyListeners();
	}
}