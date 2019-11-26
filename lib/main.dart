import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/core/viewmodels/disease_view_modal.dart';
import 'package:final_1/core/viewmodels/symptom_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/widgets/router.dart';
import 'package:final_1/core/constant/app_constant.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        builder: (context) => Auth(),
      ),

	   ChangeNotifierProvider(builder: (context) => DiseaseViewModel()),
	    ChangeNotifierProvider(builder: (context) => SymptomViewModel()),
    ],
	child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.Root,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
