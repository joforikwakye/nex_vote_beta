//THIS CLASS IS REPSONSIBLE FOR DISPLAYING THE VARIOUS CANDIDATES FOR ACES
import 'package:flutter/material.dart';
import 'package:nex_vote_beta/department_candidates/positions_aces/fin_sec.dart';
import 'package:nex_vote_beta/department_candidates/positions_aces/gen_sec.dart';
import 'package:nex_vote_beta/department_candidates/positions_aces/president.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:nex_vote_beta/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class ACES extends StatelessWidget {
  const ACES({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ACES'),
          centerTitle: true,
          backgroundColor: const Color(0xff610B0C),
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(text: 'President'),
              Tab(text: 'Fin Sec'),
              Tab(text: 'Gen Sec'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            President(),
            FinSec(),
            GenSec(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final finishedVoting = context
                .read<UserProvider>()
                .votes
                .values
                .every((element) => element["name"] != "");
            finishedVoting == true
                ? Navigator.of(context).pushNamed('/review')
                : ShowSnackBar().showSnackBar(context);
          },
          backgroundColor: const Color(0xff610B0C),
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
