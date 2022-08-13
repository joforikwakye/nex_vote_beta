import 'package:flutter/material.dart';
import 'package:nex_vote_beta/screens/coe.dart';
import 'package:nex_vote_beta/screens/cos.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        'Hello Jeff,',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Good Afternoon',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(width: 80),
                  ClipRRect(
                    child: Image.asset(
                      'assets/images/mypic.JPG',
                      width: 80,
                      height: 80,
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
                  onPressed: () {},
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
