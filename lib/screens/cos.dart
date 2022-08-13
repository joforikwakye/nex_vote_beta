//THIS SCREEN DISPLAYS THE DEPARTMENTS UNDER COLLEGE OF SCIENCE IN A SCROLLABLE CIRCLE AVATAR
import 'package:flutter/material.dart';
import '../widgets/college_avatars.dart';

class COS extends StatelessWidget {
  const COS({Key? key}) : super(key: key);

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
                'College Of Science',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff610B0C),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          //ADDITION OF IMAGES
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CollegeAvatars('assets/images/compu_sci.jpeg', 4),
                const SizedBox(width: 0),
                CollegeAvatars('assets/images/compu_sci.jpeg', 5),
                const SizedBox(width: 10),
                CollegeAvatars('assets/images/compu_sci.jpeg', 6),
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
