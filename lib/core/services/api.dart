import 'package:final_1/core/model/disease.dart';

class Api {
	static const endpoint ='';

	Future<List<Disease>> getDisease() async {
			List<Disease> disease = [];
		disease.add(new Disease(
			classify: 'Hô hấp',
			decrible: 'Ngưng thở khi ngủ trung ương có thể xảy ra như là kết quả của các điều kiện khác, chẳng hạn như suy tim và đột quỵ, ngủ ở một độ cao cũng có thể gây ngưng thở khi ngủ trung ương',
			name: 'Ngưng thở khi ngủ trung ương',
		));
		disease.add(new Disease(
			classify: 'Hô hấp',
			decrible: 'Viêm tiểu phế quản nặng có thể gây thở khó khăn đáng kể, da xanh, một dấu hiệu oxy không đầy đủ, Điều này đòi hỏi chăm sóc y tế khẩn cấp',
			name: 'Viêm tiểu phế quản',
		));
		disease.add(new Disease(
			classify: 'Xẹp phổi',
			decrible: 'Các điều kiện khác bên cạnh xẹp phổi có thể gây ra khó thở, và hầu hết yêu cầu chẩn đoán chính xác và điều trị kịp thời',
			name: 'Viêm tiểu phế quản',
		));
		return disease;
	}
	
}