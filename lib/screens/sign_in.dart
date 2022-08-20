import 'package:flutter/material.dart';
import 'package:nex_vote_beta/services/function.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Sign In',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0xff610B0C),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //THIS PROPERTY PREVENTS THE KEYBOARD FROM COVERING THE SIGN IN BUTTON
          //FIX THE RENDEROVERFLOW BUG ANOTHER TIME!!!
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              ClipRRect(
                child: Image.asset(
                  'assets/images/voter-voting.jpeg',
                  width: 150,
                  height: 150,
                ),
                borderRadius: BorderRadius.circular(80),
              ),
              const Center(
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //USERNAME TEXTFIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff610B0C),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ),
              ),
              // END OF USERNAME TEXTFIELD
              const SizedBox(height: 29),

              // PASSWORD TEXTFIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff610B0C)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
              ),
              // END OF PASSWORD TEXTFIELD
              const SizedBox(height: 120),

              //SIGIN IN BUTTON
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton(
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 16),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onPressed: () async {
                    //CONSUME THE API TO VERIFY IF THE USER IS TRULY A STUDENT AND IS SENT TO THE DASHBOARD

                    Navigator.of(context).pushReplacementNamed('/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff610B0C),
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              //END OF SIGN IN BUTTON
            ],
          ),
        ),
      ),
    );
  }
}
