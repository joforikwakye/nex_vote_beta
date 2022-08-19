//THIS CLASS IS REPSONSIBLE FOR DISPLAYING THE VARIOUS CANDIDATES FOR ACES

import 'package:flutter/material.dart';

import 'positions_aces/fin_sec.dart';
import 'positions_aces/gen_sec.dart';
import 'positions_aces/president.dart';

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
        body: const TabBarView(
          children: [
            //PRESIDENTS
            President(),
            FinSec(),
            GenSec(),
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
