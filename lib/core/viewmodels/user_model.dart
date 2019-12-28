import 'dart:convert';

import 'package:final_1/core/model/post.dart';
import 'package:final_1/core/model/user.dart';
import 'package:final_1/core/services/Auth.dart';
import 'package:final_1/ui/view/main_view/root_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  User _user;
  Post _post;
  get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  set post(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> adduser(context) async {
    String token = await Auth.getToken();
    var map = new Map<String, dynamic>();
    map["provider"] = "facebook.com";
    map["access_token"] = token.toString();

    await http
        .post(
            'https://ezhealthcare.luisnguyen.com/api/v1/mobile/user/authenticate',
            body: map)
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      print(response.body);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      if (statusCode == 200) {
        Response useresponse = Response.fromJson(json.decode(response.body));
       
	   print(useresponse.data.address	);
	   _post = useresponse.data;
	   print(_post.address);
        notifyListeners();
      } else {
        throw new Exception("Error while fetching data");
      }
    });
  }
}
