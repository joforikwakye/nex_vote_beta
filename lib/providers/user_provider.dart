import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool votesSubmitted = false;
  Map<String, String> userInfo = {"name": "", "imageUrl": ""};

  final votes = {
    "president": {"name": "", "imageUrl": ""},
    "finSec": {"name": "", "imageUrl": ""},
    "genSec": {"name": "", "imageUrl": ""},
  };
  int selectedPresident;
  int selectedGenSec;
  int selectedFinSec;

  void addVote(String potfolio, String candidate, String imageUrl) {
    // print(potfolio);
    votes[potfolio]["name"] = candidate;
    votes[potfolio]["imageUrl"] = imageUrl;
    // print('=============================== $candidate : $imageUrl');
    notifyListeners();
  }

  void initialiseProvider() {
    votesSubmitted = false;
  }

  void changeSelectedValue(int newValue, String portfolio) {
    switch (portfolio) {
      case "president":
        selectedPresident = newValue;
        break;
      case "finSec":
        selectedFinSec = newValue;
        break;
      case "genSec":
        selectedGenSec = newValue;
        break;
    }
    notifyListeners();
  }

  void storeUserInfo(String name, String imageUrl) {
    userInfo["name"] = name;
    userInfo["imageUrl"] = imageUrl;
    notifyListeners();
  }

  void votesSubmittedSuccessfuly() {
    votesSubmitted = true;
    notifyListeners();
  }
}
