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

  int selectedBiomedPresident;
  int selectedBiomedGenSec;
  int selectedBiomedFinSec;

  int selectedGesaPresident;
  int selectedGesaGenSec;
  int selectedGesaFinSec;

  void addVote(String portfolio, String candidate, String imageUrl) {
    //print(portfolio);
    votes[portfolio]["name"] = candidate;
    votes[portfolio]["imageUrl"] = imageUrl;
    // print('=============================== $candidate : $imageUrl');
    notifyListeners();
  }

  void initialiseProvider() {
    votesSubmitted = false;
  }

  void changeSelectedValue(String dept, int newValue, String portfolio) {
    if (dept == "aces") {
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
    } else if (dept == "biomed") {
      switch (portfolio) {
        case "president":
          selectedBiomedPresident = newValue;
          break;
        case "finSec":
          selectedBiomedFinSec = newValue;
          break;
        case "genSec":
          selectedBiomedGenSec = newValue;
          break;
      }
    } else if (dept == "gesa") {
      switch (portfolio) {
        case "president":
          selectedGesaPresident = newValue;
          break;
        case "finSec":
          selectedGesaFinSec = newValue;
          break;
        case "genSec":
          selectedGesaGenSec = newValue;
          break;
      }
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
