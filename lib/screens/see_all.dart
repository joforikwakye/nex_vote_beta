//THIS CLASS DISPLAYS ALL DEPARTMENTS UNDER COLLEGE OF ENGINEERING
import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College Of Engineering'),
        backgroundColor: const Color(0xff610B0C),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 26),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),

              //CIRCLE AVATARS WRAPPED IN A TEXT BUTTON TO MAKE THE ENTIRE CARD CLICKABLE
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffEDD9DB),
                  onPrimary: Colors.white,
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: Image.asset('assets/images/biomed.jpeg'),
                  ),
                  title: const Text(
                    'Biological Engineering Department',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Slogan'),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/biomed');
                },
              ),
            ),

            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffEDD9DB),
                  onPrimary: Colors.white,
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: Image.asset('assets/images/aces.jpeg'),
                  ),
                  title: const Text(
                    'Computer Engineering Department',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Slogan'),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/aces');
                },
              ),
            ),

            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffEDD9DB),
                  onPrimary: Colors.white,
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: Image.asset('assets/images/gesa.jpeg'),
                  ),
                  title: const Text(
                    'Ghana Engineering Students Association (GESA)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Slogan'),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/gesa');
                },
              ),
            ),

            //END
          ],
        ),
      ),
    );
  }
}
