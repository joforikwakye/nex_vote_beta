import 'dart:convert';

import 'package:http/http.dart';

//NOT USING THIS TOP PART. IT WAS JUST A TEST
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

//THIS IS RATHER BEING USED.WILL SEPARATE THIS LATER
class Presidents {
  final String firstName;
  final String lastName;
  final String imageUrl;

  Presidents(this.firstName, this.lastName, this.imageUrl);
}
