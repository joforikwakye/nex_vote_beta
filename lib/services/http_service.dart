import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpService {
  //responsible for making either a get or a post request to the server
  static final client = http.Client();

  static var loginUrl = Uri.parse('http://10.0.2.2:5000/login');

  static login(username, password, context) async {
    var headers = {
      'Content-Type': 'application/json',
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
      //the response body of the post request
      var json = jsonDecode(response.body);

      //saving the status and student_id from the result dictionary to navigate to the dashboard
      var status = json['status'];
      var student_id = json['student_id'];

      if (status == 'Login successful') {
        await EasyLoading.showSuccess(json['status']);
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
      if (json['status'] == 'Incorrect username or password') {
        await EasyLoading.showError(json['status']);
      } else if (json['status'] == 'Username does not exist') {
        await EasyLoading.showError(json['status']);
      }
    }
  }
}
