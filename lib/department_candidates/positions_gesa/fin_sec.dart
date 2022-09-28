//DISPLAYING THE FINANCIAL SECRETARY CANDIDATES FOR GESA

import 'package:flutter/material.dart';
import 'package:nex_vote_beta/services/api_calls.dart';
import 'package:nex_vote_beta/widgets/custom_radio_list.dart';

class FinSecGesa extends StatefulWidget {
  const FinSecGesa({Key key}) : super(key: key);

  @override
  State<FinSecGesa> createState() => _FinSecGesaState();
}

class _FinSecGesaState extends State<FinSecGesa> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCalls.getGesaFinSec(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: Text('Loading...'));
        } else
          // ignore: curly_braces_in_flow_control_structures
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
                    portfolio: "finSec",
                    dept: "gesa",
                  ),
                ),
              );
            },
          );
      },
    );
  }
}
