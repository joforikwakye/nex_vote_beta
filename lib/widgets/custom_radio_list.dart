import 'package:flutter/material.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../models/get_presidents.dart';

class CustomRadioListTile extends StatelessWidget {
  final int index;
  final snapshot;
  final String portfolio;

  const CustomRadioListTile(
      {Key key, this.index, this.snapshot, this.portfolio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupValue = getGroupValue(portfolio, context);
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
  int getGroupValue(portfolio, BuildContext context) {
    switch (portfolio) {
      case "president":
        return context.watch<UserProvider>().selectedPresident;
      case "finSec":
        return context.watch<UserProvider>().selectedFinSec;
      case "genSec":
        return context.watch<UserProvider>().selectedGenSec;
    }
    return 0;
  }

  void makeChanges(int value, BuildContext context) {
    Presidents selectedCandidate = snapshot.data[value];
    context.read<UserProvider>().changeSelectedValue(value, portfolio);
    context.read<UserProvider>().addVote(
        portfolio,
        "${selectedCandidate.firstName} ${selectedCandidate.imageUrl}",
        selectedCandidate.lastName);
  }
}
