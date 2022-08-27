import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Text(
            'NexVote',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Powered by Nexus',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xffFFEA0E),
            ),
          ),
        ],
      ),

      //i think wrapper for come
      nextScreen: SignIn(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Color(0xff610B0C),
    );
  }
}





//   //this function runs once each time the app is built
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //navigateToSignIn();
//   }

// //an async function because of the await
//   void navigateToSignIn() async {
//     await Future.delayed(Duration(seconds: 5));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         //takes a builder and context to know which class to navigate to
//         builder: (context) => SignIn(),
//       ),
//     );
//   }