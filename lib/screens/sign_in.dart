// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_vote_beta/services/http_service.dart';
import 'package:nex_vote_beta/widgets/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username = '';
  String password = '';

  bool loading = false;
  var data;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              // ignore: prefer_const_constructors
              title: Text(
                'Welcome',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 23),
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color(0xff610B0C),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              //THIS PROPERTY PREVENTS THE KEYBOARD FROM COVERING THE SIGN IN BUTTON
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),

                  //SIGN IN TEXT
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Color(0xff610B0C),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(6.9, 6.0),
                              blurRadius: 6.0,
                              color: Color(0xffEDD9DB),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //END OF SIGN IN STYLING

                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'Have a vision?\n',
                              style: GoogleFonts.lato()),
                          TextSpan(
                              text: 'Make a right decision!',
                              style: GoogleFonts.lato()),
                          TextSpan(
                            text: 'VOTE!',
                            style: GoogleFonts.lato(
                              color: Color(0xff610B0C),
                              shadows: [
                                Shadow(
                                  offset: Offset(6.9, 6.0),
                                  blurRadius: 6.0,
                                  color: Color(0xffEDD9DB),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  //USERNAME TEXTFIELD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff610B0C),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                          ),
                          onChanged: (value) {
                            setState(() {
                              username = value;
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
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
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120.0, vertical: 16),
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (username.isNotEmpty && password.isNotEmpty) {
                          setState(() => loading = true);
                          data = await HttpService.login(
                              username, password, context);
                          if (data == 'Incorrect username or password') {
                            setState(() {
                              loading = false;
                              var snackBar = const SnackBar(
                                content: Text('Incorrect username or password'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          } else if (data == 'Username does not exist') {
                            setState(() {
                              loading = false;
                              var snackBar = const SnackBar(
                                content: Text('Username does not exist'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          }
                        } else {
                          var snackBar = const SnackBar(
                            content: Text('Please provide credentials'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
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
          );
  }
}
