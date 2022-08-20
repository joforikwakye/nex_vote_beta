import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class HttpService {
  //responsible for making either a get or a post request to the server
  static final client = http.Client();

  static var loginUrl = Uri.parse('http://10.0.2.2:5000/login');

  static login(username, password, context) async {
    var headers = {
      'Content-Type': 'application/json',
      //'authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };

    final body = {
      'username': username,
      'password': password,
    };

    http.Response response = await client.post(
      loginUrl,
      headers: headers,
      body: jsonEncode(body),
    );


    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json["status"] == "Login successful") {
        await EasyLoading.showSuccess(json["status"]);
        await Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (json["status"] == "Incorrect username or password") {
        await EasyLoading.showError(json["status"]);
      } else if (json["status"] == "Username or password does not exist") {
        await EasyLoading.showError(json["status"]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : No internet connection");
    }
  }
}
