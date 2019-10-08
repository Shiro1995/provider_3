import 'package:final_1/core/model/disease.dart';
class DiseaseViewModel {


	List<Disease> disease(){

		List<Disease> disease = [];
		Disease benh1 = new Disease(
			image: 'chao',
			decrible: 'Trieu chung tre em tu 5 thang den 5 tuoi',
			tilte: 'Benh Tre em',
		);
		disease.add(benh1);
		return disease; 
	}
}