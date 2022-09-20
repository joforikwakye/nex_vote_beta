import 'package:flutter/material.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../models/position_models.dart';

class CustomRadioListTile extends StatelessWidget {
  final int index;
  // ignore: prefer_typing_uninitialized_variables
  final snapshot;
  final String portfolio;
  final String dept;

  const CustomRadioListTile(
      {Key key, this.index, this.snapshot, this.portfolio, this.dept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupValue = getGroupValue(dept, portfolio, context);
    //print("groupvalue: " + groupValue.toString());
    return RadioListTile(
      value: index,
      groupValue: groupValue,
      title: Text(
        snapshot.data[index].firstName + " " + snapshot.data[index].imageUrl,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      secondary: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: Image.network(snapshot.data[index].lastName),
      ),
      onChanged: (value) => makeChanges(value, context),
    );
  }

//saves the index of whoever you vote for
  int getGroupValue(dept, portfolio, BuildContext context) {
    if (dept == "aces") {
      switch (portfolio) {
        case "president":
          return context.watch<UserProvider>().selectedPresident;
        case "finSec":
          return context.watch<UserProvider>().selectedFinSec;
        case "genSec":
          return context.watch<UserProvider>().selectedGenSec;
      }
    } else if (dept == "biomed") {
      switch (portfolio) {
        case "president":
          return context.watch<UserProvider>().selectedBiomedPresident;
        case "finSec":
          return context.watch<UserProvider>().selectedBiomedFinSec;
        case "genSec":
          return context.watch<UserProvider>().selectedBiomedGenSec;
      }
    } else if (dept == "gesa") {
      switch (portfolio) {
        case "president":
          return context.watch<UserProvider>().selectedGesaPresident;
        case "finSec":
          return context.watch<UserProvider>().selectedGesaFinSec;
        case "genSec":
          return context.watch<UserProvider>().selectedGesaGenSec;
      }
    }

    return 0;
  }

  void makeChanges(int value, BuildContext context) {
    Presidents selectedCandidate = snapshot.data[value];
    context.read<UserProvider>().changeSelectedValue(dept, value, portfolio);

    if (dept == "aces") {
      context.read<UserProvider>().addAcesVote(
          portfolio,
          "${selectedCandidate.firstName} ${selectedCandidate.imageUrl}",
          selectedCandidate.lastName);
    } else if (dept == "biomed") {
      context.read<UserProvider>().addBiomedVote(
          portfolio,
          "${selectedCandidate.firstName} ${selectedCandidate.imageUrl}",
          selectedCandidate.lastName);
    } else if (dept == "gesa") {
      context.read<UserProvider>().addGesaVote(
          portfolio,
          "${selectedCandidate.firstName} ${selectedCandidate.imageUrl}",
          selectedCandidate.lastName);
    }
  }
}
