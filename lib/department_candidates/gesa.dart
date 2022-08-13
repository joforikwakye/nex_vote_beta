//THIS CLASS IS REPSONSIBLE FOR DISPLAYING THE VARIOUS CANDIDATES FOR ACES

import 'package:flutter/material.dart';

class Gesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('GESA'),
          centerTitle: true,
          backgroundColor: Color(0xff610B0C),
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'President'),
              Tab(text: 'Fin Sec'),
              Tab(text: 'Gen Sec'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //PRESIDENTS
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Image.asset('assets/images/president1.jpeg'),
                      ),
                      title: Text(
                        'Rexford Agyabeng Machu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Let\'s do this!'),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box_outline_blank_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Image.asset('assets/images/president2.jpeg'),
                      ),
                      title: Text(
                        'Marcel Nortey',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Of course we can!'),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box_outline_blank_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: Image.asset('assets/images/mypic.JPG'),
                          ),
                          title: Text(
                            'Kwakye Jeffrey Ofori',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('I did it!'),
                          trailing: IconButton(
                            icon: Icon(Icons.check_box_outline_blank_rounded),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //FINANCIAL SECRETARY
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Image.asset('assets/images/president1.jpeg'),
                      ),
                      title: Text(
                        'Rexford Agyabeng Machu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Let\'s do this!'),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box_outline_blank_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Image.asset('assets/images/president2.jpeg'),
                      ),
                      title: Text(
                        'Marcel Nortey',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Of course we can!'),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box_outline_blank_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: Image.asset('assets/images/mypic.JPG'),
                          ),
                          title: Text(
                            'Kwakye Jeffrey Ofori',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('I did it!'),
                          trailing: IconButton(
                            icon: Icon(Icons.check_box_outline_blank_rounded),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //END OF FIN SEC

            //GENERAL SECRETARY
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Image.asset('assets/images/president1.jpeg'),
                      ),
                      title: Text(
                        'Rexford Agyabeng Machu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Let\'s do this!'),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box_outline_blank_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Image.asset('assets/images/president2.jpeg'),
                      ),
                      title: Text(
                        'Marcel Nortey',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Of course we can!'),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box_outline_blank_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xffEDD9DB)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: Image.asset('assets/images/mypic.JPG'),
                          ),
                          title: Text(
                            'Kwakye Jeffrey Ofori',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('I did it!'),
                          trailing: IconButton(
                            icon: Icon(Icons.check_box_outline_blank_rounded),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/review');
          },
          backgroundColor: Color(0xff610B0C),
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
