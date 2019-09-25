import 'package:final_1/ui/view/home_screen.dart';
import 'package:final_1/ui/view/main_screen.dart';
import 'package:final_1/ui/view/signin_screen.dart';
import 'package:final_1/ui/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/ui/view/login_view.dart';
import '../../main.dart';
// import 'package:provider_arc/core/constants/app_contstants.dart';
// import 'package:provider_arc/core/models/post.dart';
// import 'package:provider_arc/ui/views/home_view.dart';
// import 'package:provider_arc/ui/views/login_view.dart';
// import 'package:provider_arc/ui/views/post_view.dart';

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

      //   case RoutePaths.Post:
      //     var post = settings.arguments as Post;
      //     return MaterialPageRoute(builder: (_) => PostView(post: post));
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
