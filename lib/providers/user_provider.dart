import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool votesSubmitted = false;
  bool votesSubmittedBiomed = false;
  bool votesSubmittedGesa = false;
  Map<String, String> userInfo = {"name": "", "imageUrl": ""};

  //aces map
  final acesVotes = {
    "president": {"name": "", "imageUrl": ""},
    "finSec": {"name": "", "imageUrl": ""},
    "genSec": {"name": "", "imageUrl": ""},
  };

  //biomed map
  final biomedVotes = {
    "president": {"name": "", "imageUrl": ""},
    "finSec": {"name": "", "imageUrl": ""},
    "genSec": {"name": "", "imageUrl": ""},
  };

  //gesa map
  final gesaVotes = {
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

  void addAcesVote(String portfolio, String candidate, String imageUrl) {
    //print(portfolio);
    acesVotes[portfolio]["name"] = candidate;
    acesVotes[portfolio]["imageUrl"] = imageUrl;
    // print('=============================== $candidate : $imageUrl');
    notifyListeners();
  }

  void addBiomedVote(String portfolio, String candidate, String imageUrl) {
    biomedVotes[portfolio]["name"] = candidate;
    biomedVotes[portfolio]["imageUrl"] = imageUrl;
    notifyListeners();
  }

  void addGesaVote(String portfolio, String candidate, String imageUrl) {
    gesaVotes[portfolio]["name"] = candidate;
    gesaVotes[portfolio]["imageUrl"] = imageUrl;
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

  void votesSubmittedSuccessfulyAces() {
    votesSubmitted = true;
    notifyListeners();
  }

  void votesSubmittedSuccessfulyBiomed() {
    votesSubmittedBiomed = true;
    notifyListeners();
  }

  void votesSubmittedSuccessfulyGesa() {
    votesSubmittedGesa = true;
    notifyListeners();
  }
}
