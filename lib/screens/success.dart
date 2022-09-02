import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200),
              Image.asset(
                'assets/images/success2.png',
              ),
              const SizedBox(height: 20),
              const Text(
                'Your response has been recorded',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 120),
              Row(
                children: [
                  const SizedBox(width: 110),
                  ElevatedButton(
                    child: Text('Go Home'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff610B0C),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: Text('About Us'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => const AlertDialog(
                          title: Text("About Us"),
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
