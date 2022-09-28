import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer(); // SplashScreen delay function
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff610b0c),
                gradient: LinearGradient(
                    colors: [(Color(0xff610b0c)), (Color(0xff610b0c))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          const Center(
              //alignment: Alignment.topCenter,
              child: Align(
            alignment: Alignment(0.00, 0.2),
            child: Text(
              "NexVote",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 025),
            ),
          )),
          const Center(
            child: Icon(
              Icons.how_to_vote,
              size: 120,
              color: Colors.white,
            ),
          ),
          Center(
            child: Align(
              alignment: const Alignment(0.00, 0.8),
              child: Text(
                "POWERED BY NEXUS",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xffFFEA0E),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}




      //   children: const [
      //     Text(
      //       'NexVote',
      //       style: TextStyle(
      //         fontSize: 40,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //       ),
      //     ),
      //     Text(
      //       'Powered by Nexus',
      //       style: TextStyle(
      //         fontSize: 15,
      //         color: Color(0xffFFEA0E),
      //       ),
      //     ),
      //   ],
      // ),