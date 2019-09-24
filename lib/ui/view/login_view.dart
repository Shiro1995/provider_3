
import 'package:final_1/ui/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/core/viewmodels/login_view_model.dart';
import 'package:final_1/ui/shared/app_colors.dart';

import 'base_widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
        model: LoginViewModel(authenticationService: Provider.of(context)),
        builder: (context, model, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: WelcomeScreen(),
            ));
  }
}
