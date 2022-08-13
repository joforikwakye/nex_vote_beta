//MAKING SURE YOU HAVE VOTED FOR THE PEOPLE OF YOUR CHOICE
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        centerTitle: true,
        backgroundColor: const Color(0xff610B0C),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //THIS WILL BE BASED ON USER CHOICES FROM PREVIOUS SCREEN, ATM HARDCODING IT
            SizedBox(height: 70),
            Text(
              'President',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: Image.asset('assets/images/president1.jpeg'),
                ),
                title: const Text(
                  'Rexford Agyabeng Machu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Let\'s do this!'),
              ),
            ),

            SizedBox(height: 20),
            Text(
              'Financial Sec',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: Image.asset('assets/images/mypic.JPG'),
                ),
                title: const Text(
                  'Kwakye Jeffrey Ofori',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('I did it!'),
              ),
            ),

            SizedBox(height: 20),
            Text(
              'General Sec',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: Image.asset('assets/images/president2.jpeg'),
                ),
                title: const Text(
                  'Nortey Marcel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Of course we can!'),
              ),
            ),

            SizedBox(height: 180),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton(
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 16),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Submit"),
                        content: const Text("Are you sure you want to submit?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/success');
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff610B0C),
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
