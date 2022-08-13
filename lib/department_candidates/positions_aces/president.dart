//DISPLAYING THE PRESIDENTIAL CANDIDATES FOR ACES

import 'package:flutter/material.dart';

class President extends StatelessWidget {
  const President({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 50),
          //1ST
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
              trailing: IconButton(
                icon: const Icon(Icons.check_box_outline_blank_rounded),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),

          //2ND
          Container(
            decoration: const BoxDecoration(color: Color(0xffEDD9DB)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Image.asset('assets/images/president2.jpeg'),
              ),
              title: const Text(
                'Marcel Nortey',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Of course we can!'),
              trailing: IconButton(
                icon: const Icon(Icons.check_box_outline_blank_rounded),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),

          //3RD
          Column(
            children: [
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
                  trailing: IconButton(
                    icon: const Icon(Icons.check_box_outline_blank_rounded),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
