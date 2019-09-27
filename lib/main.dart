import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_1/provider_setup.dart';
import 'ui/widgets/router.dart';
import 'package:final_1/core/constant/app_constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Root,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
