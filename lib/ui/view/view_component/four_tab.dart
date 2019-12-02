import 'dart:convert';

import 'package:final_1/core/model/disease.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Disease> fetchPost() async {
  final response =
      await http.get('https://luisnguyen.com/api/v1/application/construction/config');
	  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Disease.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
class TagFour extends StatefulWidget {
  @override
  _TagFourState createState() => _TagFourState();
}

class _TagFourState extends State<TagFour> {
	
	
  Future<Disease> disease;
    @override
  void initState() {
    super.initState();
    disease = fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Disease>(
          future: disease,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Text(snapshot.data.classify);
            else if (snapshot.hasError) {
              return Text("${snapshot.error}"+"asfa");
            }
			 return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
