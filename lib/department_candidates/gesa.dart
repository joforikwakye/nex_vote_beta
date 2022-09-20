//THIS CLASS IS REPSONSIBLE FOR DISPLAYING THE VARIOUS CANDIDATES FOR ACES

import 'package:flutter/material.dart';
import 'package:nex_vote_beta/department_candidates/positions_gesa/fin_sec.dart';
import 'package:nex_vote_beta/department_candidates/positions_gesa/gen_sec.dart';
import 'package:nex_vote_beta/department_candidates/positions_gesa/president.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../widgets/snack_bar.dart';

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
            PresidentGesa(),
            FinSecGesa(),
            GenSecGesa(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final finishedVoting = context
                .read<UserProvider>()
                .gesaVotes
                .values
                .every((element) => element["name"] != "");
            finishedVoting == true
                ? Navigator.of(context).pushNamed('/review_gesa')
                : ShowSnackBar().showSnackBar(context);
          },
          backgroundColor: Color(0xff610B0C),
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
