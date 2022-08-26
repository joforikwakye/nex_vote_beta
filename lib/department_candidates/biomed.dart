//THIS CLASS IS REPSONSIBLE FOR DISPLAYING THE VARIOUS CANDIDATES FOR BIOMED
import 'package:flutter/material.dart';
import 'package:nex_vote_beta/department_candidates/positions_biomed/fin_sec.dart';
import 'package:nex_vote_beta/department_candidates/positions_biomed/gen_sec.dart';
import 'package:nex_vote_beta/department_candidates/positions_biomed/president.dart';

class BIOMED extends StatelessWidget {
  const BIOMED({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BIOMED'),
          centerTitle: true,
          backgroundColor: const Color(0xff610B0C),
          elevation: 0,
          bottom: const TabBar(
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
            PresidentBiomed(),
            FinSecBiomed(),
            GenSecBiomed(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/review');
          },
          backgroundColor: const Color(0xff610B0C),
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
