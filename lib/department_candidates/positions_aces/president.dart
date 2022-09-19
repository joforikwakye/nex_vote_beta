//DISPLAYING THE PRESIDENTIAL CANDIDATES FOR ACES

import 'package:flutter/material.dart';
import 'package:nex_vote_beta/services/api_calls.dart';
import 'package:nex_vote_beta/widgets/custom_radio_list.dart';

class President extends StatefulWidget {
  const President({Key key}) : super(key: key);

  @override
  State<President> createState() => _PresidentState();
}

class _PresidentState extends State<President> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCalls.getPresidents(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: Text('Loading...'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
                  padding: const EdgeInsets.all(10),
                  child: CustomRadioListTile(
                    index: index,
                    snapshot: snapshot,
                    portfolio: "president",
                    dept: "aces",
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
