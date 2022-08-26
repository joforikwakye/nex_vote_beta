import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/http_service.dart' as http;

class CollegeAvatars extends StatelessWidget {
  final String imageUrl;
  final int imageId;

  // ignore: use_key_in_widget_constructors
  const CollegeAvatars(this.imageUrl, this.imageId);

/*THIS FUNCTION DETERMINES THE IMAGEID BEING PASSED TO THE CONSTRUCTOR AND 
NAVIGATES TO THE APPROPRIATE SCREEN */
  void navigations(BuildContext context) async {
    if (imageId == 1) {
      Response response =
          await get(Uri.parse('http://10.0.2.2:5000/presidents'));
      var data = jsonDecode(response.body);

      List presidents = [];

      presidents.add(data);

      Navigator.of(context).pushNamed('/aces', arguments: {'data': presidents});
    } else if (imageId == 2) {
      Navigator.of(context).pushNamed('/biomed');
    } else if (imageId == 3) {
      Navigator.of(context).pushNamed('/gesa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //CALLS THE FUNCTION TO DETERMINE THE APPROPRIATE SCREEN
        navigations(context);
      },

      //THE TEMPLATE FOR CREATING AVATARS WITH IMAGES
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Container(
          width: 134,
          height: 134,
          color: Colors.grey,
          child: Image.asset(imageUrl),
        ),
      ),

      //END
    );
  }
}
