import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nex_vote_beta/models/get_presidents.dart';

class ApiCalls {
  //GESA API CALLS
  static Future getGesaPresidents() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/gesa_presidents'));
    var jsonData = jsonDecode(response.body);

    //maintaining this naming convention because the other classes literally have the same data
    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  static Future getGesaGenSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/gesa_gensec'));
    var jsonData = jsonDecode(response.body);

    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  static Future getGesaFinSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/gesa_finsec'));
    var jsonData = jsonDecode(response.body);

    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  //END OF GESA API CALLS

  //ACES API CALLS
  static Future getPresidents() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/aces_presidents'));
    var jsonData = jsonDecode(response.body);

    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  static Future getFinSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/aces_finsec'));
    var jsonData = jsonDecode(response.body);

    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  static Future getGenSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/aces_gensec'));
    var jsonData = jsonDecode(response.body);

    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  //END OF ACES API CALLS.

  //BIOMED API CALLS
  static Future getBiomedPresident() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/biomed_presidents'));
    var jsonData = jsonDecode(response.body);

    //maintaining this naming convention because the other classes literally have the same data
    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  static Future getBiomedGenSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/biomed_gensec'));
    var jsonData = jsonDecode(response.body);

    //maintaining this naming convention because the other classes literally have the same data
    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  static Future getBiomedFinSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/biomed_finsec'));
    var jsonData = jsonDecode(response.body);

    //maintaining this naming convention because the other classes literally have the same data
    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }
}
