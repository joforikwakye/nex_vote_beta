import 'package:flutter/material.dart';
import 'package:nex_vote_beta/screens/coe.dart';
import 'package:nex_vote_beta/screens/cos.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map data = {};

  String get greeting {
    var greeting = '';
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour >= 12 && hour <= 17) {
      greeting = 'Good Afternoon';
    } else if (hour >= 18) {
      greeting = 'Good Evening';
    }

    return greeting;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('NexVote'),
        backgroundColor: const Color(0xff610B0C),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${data['name']},',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        greeting,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: 80),
                  ClipRRect(
                    child: Image.network(
                      '${data['url']}',
                      height: 80,
                      width: 80,
                    ),
                    borderRadius: BorderRadius.circular(80),
                  ),
                ],
              ),
            ),

            //SIGN OUT BUTTON
            Container(
              margin: const EdgeInsets.only(left: 264),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ElevatedButton(
                  child: const Text(
                    'Sign out',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/sign_in');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff610B0C),
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ),
            //END
            const SizedBox(height: 50),

            //COLLEGE OF ENGINEERING
            COE(),
            const SizedBox(height: 20),

            //COLLEGE OF SCIENCE
            COS(),
          ],
        ),
      ),
    );
  }
}
