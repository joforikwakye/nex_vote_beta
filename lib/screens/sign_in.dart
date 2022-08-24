import 'package:flutter/material.dart';
import 'package:nex_vote_beta/services/http_service.dart';
import 'package:nex_vote_beta/widgets/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

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
        ? Loading()
        : Scaffold(
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
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 120.0, vertical: 16),
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 18),
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
                                  content:
                                      Text('Incorrect username or password'),
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
            ),
          );
  }
}
