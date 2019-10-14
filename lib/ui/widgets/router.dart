import 'package:final_1/ui/view/main_view/home_screen.dart';
import 'package:final_1/ui/view/view_component/first_main/header_first.dart';
import 'package:final_1/ui/view/view_component/first_main/symptoms_list.dart';
import 'package:final_1/ui/view/view_component/main_screen.dart';
import 'package:final_1/ui/view/main_view/root_screen.dart';
import 'package:final_1/ui/view/main_view/signin_screen.dart';
import 'package:final_1/ui/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:final_1/core/constant/app_constant.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RoutePaths.Welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case RoutePaths.Main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePaths.Root:
        return MaterialPageRoute(builder: (_) => RootScreen());
      case RoutePaths.Sysptomt:
        return MaterialPageRoute(builder: (_) => ListSymptoms());
		case RoutePaths.Sysptomt1:
        return MaterialPageRoute(builder: (_) => DeckScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
