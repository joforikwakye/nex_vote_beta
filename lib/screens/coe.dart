//THIS SCREEN DISPLAYS THE DEPARTMENTS UNDER COE IN A SCROLLABLE CIRCLE AVATAR

import 'package:flutter/material.dart';
import '../widgets/college_avatars.dart';

class COE extends StatelessWidget {
  const COE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'College Of Engineering',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff610B0C),
                ),
              ),

              //THE SEE ALL BUTTON
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/see_all');
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              //END
            ],
          ),
          const SizedBox(height: 5),

          //THIS IS WHERE THE IMAGES ARE ADDED WITH A SCROLL DIRECTION
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CollegeAvatars('assets/images/aces.jpeg', 1),
                const SizedBox(width: 0),
                CollegeAvatars('assets/images/biomed.jpeg', 2),
                const SizedBox(width: 10),
                CollegeAvatars('assets/images/gesa.jpeg', 3),
                const SizedBox(width: 10),
              ],
            ),
          ),

          //END
        ],
      ),
    );
  }
}
