import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nex_vote_beta/models/get_presidents.dart';

class ApiCalls {
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
}
