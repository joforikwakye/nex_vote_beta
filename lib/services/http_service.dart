import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nex_vote_beta/models/set_args.dart';

class HttpService {
  static final client = http.Client();

  static var loginUrl = Uri.parse('http://10.0.2.2:5000/login');
  static var getPresidentsUrl = Uri.parse('http://10.0.2.2:5000/presidents');

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

    var json;

    if (response.statusCode == 200) {
      //the response body of the post request
      //print(response.body);
      json = jsonDecode(response.body);

      //saving the status and student_id from the result dictionary to navigate to the dashboard
      var status = json['status'];
      var studentId = json['student_id'];

      if (json['status'] == 'Login successful') {
        //await EasyLoading.showSuccess(json['status']);
        http.Response response2 = await client
            .get(Uri.parse('http://10.0.2.2:5000/student/$studentId'));

        if (response2.statusCode == 200) {
          var json = jsonDecode(response2.body);

          var firstName = json['first_name'];
          var imageUrl = json['image'];

          SetArgs args = SetArgs();
          args.setFirstName(firstName);
          args.setImageUrl(imageUrl);

          Navigator.pushReplacementNamed(
            context,
            '/dashboard',
            arguments: {
              'name': args.getFirstName,
              'url': args.getImageUrl,
            },
          );
          return 'success';
        }
      } else if (json['status'] == 'Incorrect username or password') {
        return json['status'];
      } else if (json['status'] == 'Username does not exist') {
        return json['status'];
      }
    } else if (response.statusCode == 500) {
      Navigator.pushReplacementNamed(context, '/sign_in');
      var snackBar = const SnackBar(
        content: Text('Please check internet connection'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
