//DISPLAYING THE GENERAL SECRETARY CANDIDATES FOR GESA

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nex_vote_beta/models/get_presidents.dart';
import 'package:nex_vote_beta/widgets/custom_radio_list.dart';

class GenSecGesa extends StatefulWidget {
  const GenSecGesa({Key key}) : super(key: key);

  @override
  State<GenSecGesa> createState() => _GenSecGesaState();
}

class _GenSecGesaState extends State<GenSecGesa> {
  int selectedValue = 4;
  Future getGesaGenSec() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/gesa_gensec'));
    var jsonData = jsonDecode(response.body);

    //maintaining this naming convention because the other classes literally have the same data
    //but changed the function name tho
    List<Presidents> presidents = [];
    for (var pres in jsonData) {
      Presidents president =
          Presidents(pres['firstname'], pres['imageurl'], pres['lastname']);
      presidents.add(president);
    }

    return presidents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGesaGenSec(),
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
                  ),
                ),
              );
            },
          );
      },
    );
  }
}
