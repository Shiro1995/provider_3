import 'package:flutter/widgets.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/core/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  Auth _authenticationService;

  LoginViewModel({
    @required Auth authenticationService,
  }) : _authenticationService = authenticationService;

	// Future<bool> login(String userID) async {
	// 	setBusy(true);
	// 	var userId = int.tryParse(userIdText);
    // var success = await _authenticationService.f(userId);
    // setBusy(false);
    // return success;
	// }
//   Future<bool> login(String userIdText) async {
//     setBusy(true);
//     var userId = int.tryParse(userIdText);
//     var success = await _authenticationService.login(userId);
//     setBusy(false);
//     return success;
//   }
}
