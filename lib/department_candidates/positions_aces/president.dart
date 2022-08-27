//DISPLAYING THE PRESIDENTIAL CANDIDATES FOR ACES

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nex_vote_beta/models/get_presidents.dart';

class President extends StatefulWidget {
  const President({Key key}) : super(key: key);

  @override
  State<President> createState() => _PresidentState();
}

class _PresidentState extends State<President> {
  int selectedValue = 4;
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPresidents(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
              child: Text('Please check internet connectivity and retry'));
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
                  child: RadioListTile(
                    value: 0,
                    groupValue: selectedValue,
                    title: Text(
                      snapshot.data[index].firstName +
                          " " +
                          snapshot.data[index].imageUrl,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    secondary: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: Image.network(snapshot.data[index].lastName),
                    ),
                    onChanged: (int value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
              );
            },
          );
      },
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       child: ListView(
//         padding: EdgeInsets.symmetric(vertical: 16),
//         children: [
//           const SizedBox(height: 50),

//           //1ST
//           Container(
//             decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
//             padding: EdgeInsets.all(10),
//             child: RadioListTile(
//               value: 0,
//               groupValue: selectedValue,
//               title: Text(
//                 'Rexford Machu',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               secondary: ClipRRect(
//                 borderRadius: BorderRadius.circular(27),
//                 child: Image.asset('assets/images/president1.jpeg'),
//               ),
//               onChanged: (int value) {
//                 setState(() {
//                   selectedValue = value;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 20),

//           //2ND
//           Container(
//             decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
//             padding: EdgeInsets.all(10),
//             child: RadioListTile(
//               value: 1,
//               groupValue: selectedValue,
//               title: Text(
//                 'Marcel Nortey',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               secondary: ClipRRect(
//                 borderRadius: BorderRadius.circular(27),
//                 child: Image.asset('assets/images/president2.jpeg'),
//               ),
//               onChanged: (int value) {
//                 setState(() {
//                   selectedValue = value;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 20),

//           //3RD
//           Container(
//             decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
//             padding: EdgeInsets.all(10),
//             child: RadioListTile(
//               value: 2,
//               groupValue: selectedValue,
//               title: Text(
//                 'Jeffrey Ofori Kwakye',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               secondary: ClipRRect(
//                 borderRadius: BorderRadius.circular(27),
//                 child: Image.asset('assets/images/mypic.JPG'),
//               ),
//               onChanged: (int value) {
//                 setState(() {
//                   selectedValue = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
