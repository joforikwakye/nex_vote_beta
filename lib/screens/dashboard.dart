import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:nex_vote_beta/screens/coe.dart';
import 'package:nex_vote_beta/screens/cos.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String get greeting {
    var greeting = '';
    var time = DateTime.now();

    if (time.hour < 12) {
      greeting = 'Good Morning.';
    } else if (time.hour >= 12 && time.hour <= 16) {
      greeting = 'Good Afternoon.';
    } else if (time.hour >= 17) {
      greeting = 'Good Evening.';
    }

    return greeting;
  }

  @override
  Widget build(BuildContext context) {
    var data = context.watch<UserProvider>().userInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('NexVote'),
        backgroundColor: const Color(0xff610B0C),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => const AlertDialog(
                  title: Text("About Us"),
                  content: Text(
                      "This app is developed and maintained by members of group nexus."),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sign_in');
            },
          ),
        ],
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
                      const SizedBox(height: 10),
                      Text(
                        'Hello ${data['name']},',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        greeting,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                  ClipRRect(
                    // ignore: sort_child_properties_last
                    child: Image.network(
                      '${data['imageUrl']}',
                      width: 80,
                      height: 80,
                    ),
                    borderRadius: BorderRadius.circular(80),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            //COLLEGE OF ENGINEERING
            const COE(),
            const SizedBox(height: 20),

            //COLLEGE OF SCIENCE
            const COS(),
          ],
        ),
      ),
    );
  }
}
