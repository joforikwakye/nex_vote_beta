import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nex_vote_beta/department_candidates/biomed.dart';
import 'package:nex_vote_beta/department_candidates/aces.dart';
import 'package:nex_vote_beta/department_candidates/gesa.dart';
import 'package:nex_vote_beta/screens/dashboard.dart';
import 'package:nex_vote_beta/screens/review.dart';
import 'package:nex_vote_beta/screens/see_all.dart';
import 'package:nex_vote_beta/screens/success.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dashboard': (context) => const Dashboard(),
        '/see_all': (context) => const SeeAll(),
        '/review': (context) => const ReviewScreen(),
        '/gesa': (context) => Gesa(),
        '/aces': (context) => const ACES(),
        '/biomed': (context) => const BIOMED(),
        '/success': (context) => const SuccessPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
