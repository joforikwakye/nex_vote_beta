import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nex_vote_beta/screens/dashboard.dart';
import 'package:nex_vote_beta/models/set_args.dart';

class HttpService {
  //responsible for making either a get or a post request to the server
  static final client = http.Client();

  static var loginUrl = Uri.parse('http://10.0.2.2:5000/login');
  static var getStudentNameAndImage = Uri.parse('http://10.0.2.2:5000/student');

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
      var studentId = json['student_id'];

      if (status == 'Login successful') {
        await EasyLoading.showSuccess(json['status']);
        fetchFirstnameAndImageUrl(studentId);
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
      if (json['status'] == 'Incorrect username or password') {
        await EasyLoading.showError(json['status']);
      } else if (json['status'] == 'Username does not exist') {
        await EasyLoading.showError(json['status']);
      }
    }
  }

//gets the student id and returns the first name and image url
  static fetchFirstnameAndImageUrl(var studentId) async {
    http.Response response =
        await client.get(Uri.parse('http://10.0.2.2:5000/student/$studentId'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      var firstName = json['first_name'];
      var imageUrl = json['image'];

      SetArgs args = SetArgs();
      args.setFirstName(firstName);
      args.setImageUrl(imageUrl);

      // print("name: " + args.getFirstName);
      // print("url: " + args.getImageUrl);
    }
  }
}
