// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nex_vote_beta/services/http_service.dart';
import 'package:nex_vote_beta/widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';

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
            body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  //WELCOME AND VOTE ICON
                  Container(
                    height: 390,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(90)),
                      color: Color(0xff610b0c),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: const Icon(
                              Icons.how_to_vote,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 35),
                            alignment: Alignment.bottomRight,
                            child: const Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //END OF WELCOME AND VOTE SECTION

                  //USERNAME TEXTFIELD
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 50),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      cursorColor: Color(0xff610b0c),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xff610b0c),
                        ),
                        hintText: "Student Username",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                  ),
                  //END OF USERNAME TEXTFIELD

                  //PASSWORD TEXTFIELD
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffEEEEEE),
                    ),
                    child: TextField(
                      obscureText: true,
                      cursorColor: Color(0xff610b0c),
                      decoration: InputDecoration(
                        focusColor: Color(0xff610b0c),
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xff610b0c),
                        ),
                        hintText: "Enter Password",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  //END OF PASSWORD TEXTFIELD

                  //SIGN IN BUTTON
                  SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 120.0, vertical: 16),
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
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



// Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               title: Text(
//                 'Welcome',
//                 style: GoogleFonts.lato(
//                   textStyle: TextStyle(fontSize: 23),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               elevation: 0,
//               backgroundColor: Color(0xff610B0C),
//             ),
//             body: SingleChildScrollView(
//               //THIS PROPERTY PREVENTS THE KEYBOARD FROM COVERING THE SIGN IN BUTTON
//               reverse: true,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 100),
//                   Container(
//                     margin: const EdgeInsets.only(left: 20),
//                     padding: const EdgeInsets.all(15),
//                     child: Text(
//                       'Sign In',
//                       style: GoogleFonts.lato(
//                         textStyle: const TextStyle(
//                           color: Color(0xff610B0C),
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               offset: Offset(6.9, 6.0),
//                               blurRadius: 6.0,
//                               color: Color(0xffEDD9DB),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   //END OF SIGN IN STYLE
//                   const SizedBox(height: 50),

//                   //SLOGAN STYLING
//                   Container(
//                     margin: const EdgeInsets.only(left: 30),
//                     child: RichText(
//                       text: TextSpan(
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 34,
//                           color: Colors.black,
//                         ),
//                         children: [
//                           TextSpan(
//                               text: 'Have a vision?\n',
//                               style: GoogleFonts.lato()),
//                           TextSpan(
//                               text: 'Make a right decision!',
//                               style: GoogleFonts.lato()),
//                           TextSpan(
//                             text: 'VOTE!',
//                             style: GoogleFonts.lato(
//                               color: Color(0xff610B0C),
//                               shadows: [
//                                 Shadow(
//                                   offset: Offset(6.9, 6.0),
//                                   blurRadius: 6.0,
//                                   color: Color(0xffEDD9DB),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //END OF SLOGAN STYLING

//                   const SizedBox(height: 40),

//                   //USERNAME TEXTFIELD
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Color(0xff610B0C),
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 10.0),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Username',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               username = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   // END OF USERNAME TEXTFIELD
//                   const SizedBox(height: 29),

//                   // PASSWORD TEXTFIELD
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xff610B0C)),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Password',
//                           ),
//                           obscureText: true,
//                           onChanged: (value) {
//                             setState(() {
//                               password = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   // END OF PASSWORD TEXTFIELD
//                   const SizedBox(height: 59),

//                   //SIGIN IN BUTTON
//                   Container(
//                     margin: const EdgeInsets.only(left: 30),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: ElevatedButton(
//                         // ignore: sort_child_properties_last
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 120.0, vertical: 16),
//                           child: Text(
//                             'Sign in',
//                             style: GoogleFonts.lato(
//                               textStyle: const TextStyle(
//                                 fontSize: 19,
//                               ),
//                             ),
//                           ),
//                         ),
//                         onPressed: () async {
//                           if (username.isNotEmpty && password.isNotEmpty) {
//                             setState(() => loading = true);
//                             data = await HttpService.login(
//                                 username, password, context);
//                             if (data == 'Incorrect username or password') {
//                               setState(() {
//                                 loading = false;
//                                 var snackBar = const SnackBar(
//                                   content:
//                                       Text('Incorrect username or password'),
//                                   backgroundColor: Colors.red,
//                                 );
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(snackBar);
//                               });
//                             } else if (data == 'Username does not exist') {
//                               setState(() {
//                                 loading = false;
//                                 var snackBar = const SnackBar(
//                                   content: Text('Username does not exist'),
//                                   backgroundColor: Colors.red,
//                                 );
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(snackBar);
//                               });
//                             }
//                           } else {
//                             var snackBar = const SnackBar(
//                               content: Text('Please provide credentials'),
//                               backgroundColor: Colors.red,
//                             );
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: const Color(0xff610B0C),
//                           onPrimary: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   //END OF SIGN IN BUTTON
//                 ],
//               ),
//             ),
//           );