//DISPLAYING THE PRESIDENTIAL CANDIDATES FOR ACES

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nex_vote_beta/models/get_presidents.dart';
import 'package:nex_vote_beta/widgets/custom_radio_list.dart';

class President extends StatefulWidget {
  const President({Key key}) : super(key: key);

  @override
  State<President> createState() => _PresidentState();
}

class _PresidentState extends State<President> {
  int selectedValue;
  Future getPresidents() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:5000/presidents'));
    var jsonData = jsonDecode(response.body);

    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPresidents(),
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
