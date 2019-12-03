import 'package:final_1/router.dart';
import 'package:flutter/material.dart';
import 'package:final_1/core/constant/app_constant.dart';
import 'package:provider/provider.dart';
import 'core/viewmodels/disease_view_modal.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(builder: (context) => DiseaseViewModel()),
    ],child: MyApp()),
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
