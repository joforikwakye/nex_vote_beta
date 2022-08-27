import 'dart:convert';

import 'package:http/http.dart';

class GetPresidents {
  Future getPresidents() async {
    var response = await get(Uri.parse('http://10.0.2.2:5000/presidents'));
    var jsonData = jsonDecode(response.body);

    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['lastname'], pres['imageurl']);
      presidents.add(president);
    }

    return presidents;
  }
}

class Presidents {
  final String firstName;
  final String lastName;
  final String imageUrl;

  Presidents(this.firstName, this.lastName, this.imageUrl);
}
