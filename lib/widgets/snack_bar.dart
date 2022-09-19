//SHOWS THE ERROR MESSAGE WHEN YOU CLICK TO GOTO REVIEW SCREEN WHEN YOU ARE NOT DONE VOTING

import 'package:flutter/material.dart';

class ShowSnackBar {
  void showSnackBar(BuildContext context) {
    var snackBar = const SnackBar(
      content: Text('Please vote for every position'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
