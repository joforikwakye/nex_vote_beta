import 'package:flutter/material.dart';
import 'package:nex_vote_beta/department_candidates/biomed.dart';
import 'package:nex_vote_beta/department_candidates/aces.dart';
import 'package:nex_vote_beta/department_candidates/gesa.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:nex_vote_beta/screens/dashboard.dart';
import 'package:nex_vote_beta/screens/reviews/review_aces.dart';
import 'package:nex_vote_beta/screens/reviews/review_biomed.dart';
import 'package:nex_vote_beta/screens/reviews/review_gesa.dart';
import 'package:nex_vote_beta/screens/see_all.dart';
import 'package:nex_vote_beta/screens/sign_in.dart';
import 'package:nex_vote_beta/screens/success.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        routes: {
          '/dashboard': (context) => const Dashboard(),
          '/see_all': (context) => const SeeAll(),
          '/review_aces': (context) => const ReviewScreen(),
          '/review_biomed': (context) => const ReviewBiomedScreen(),
          '/review_gesa': (context) => const ReviewGesaScreen(),
          '/gesa': (context) => Gesa(),
          '/aces': (context) => const ACES(),
          '/biomed': (context) => const BIOMED(),
          '/success': (context) => const SuccessPage(),
          '/sign_in': (context) => const SignIn(),
        },
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
