import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              Image.asset(
                'assets/images/success2.png',
              ),
              SizedBox(height: 20),
              Text(
                'Your response has been recorded',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 120),
              Row(
                children: [
                  SizedBox(width: 110),
                  ElevatedButton(
                    child: Text('Go Home'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff610B0C),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    child: Text('About Us'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("About Us"),
                          content: Text(
                              'This app is developed and maintained by members of group nexus.'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff610B0C),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
