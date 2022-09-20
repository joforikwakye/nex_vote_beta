//MAKING SURE YOU HAVE VOTED FOR THE PEOPLE OF YOUR CHOICE
import 'package:flutter/material.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Votes'),
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
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: Image.network(context
                      .watch<UserProvider>()
                      .acesVotes["president"]["imageUrl"]),
                ),
                title: Text(
                  context.watch<UserProvider>().acesVotes["president"]["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: Image.network(context
                      .watch<UserProvider>()
                      .acesVotes["finSec"]["imageUrl"]),
                ),
                title: Text(
                  context.watch<UserProvider>().acesVotes["finSec"]["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  child: Image.network(context
                      .watch<UserProvider>()
                      .acesVotes["genSec"]["imageUrl"]),
                ),
                title: Text(
                  context.watch<UserProvider>().acesVotes["genSec"]["name"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 150),
            context.watch<UserProvider>().votesSubmitted == false
                ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 120.0, vertical: 16),
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
                              content: const Text(
                                  "Are you sure you want to submit?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<UserProvider>()
                                        .votesSubmittedSuccessfulyAces();
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
                  )
                : Center(
                    child: Text(
                      'Submitted',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
