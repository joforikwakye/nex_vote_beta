import 'package:flutter/material.dart';
import 'package:nex_vote_beta/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CollegeAvatars extends StatelessWidget {
  final String imageUrl;
  final int imageId;

  // ignore: use_key_in_widget_constructors
  const CollegeAvatars(this.imageUrl, this.imageId);

/*THIS FUNCTION DETERMINES THE IMAGEID BEING PASSED TO THE CONSTRUCTOR AND 
NAVIGATES TO THE APPROPRIATE SCREEN */
  void navigations(BuildContext context) async {
    if (imageId == 1) {
      final finishedVoting = context
          .read<UserProvider>()
          .acesVotes
          .values
          .every((element) => element["name"] != "");
      finishedVoting == true
          ? Navigator.of(context).pushNamed('/review_aces')
          : Navigator.of(context).pushNamed('/aces');
    } else if (imageId == 2) {
      final finishedVoting = context
          .read<UserProvider>()
          .biomedVotes
          .values
          .every((element) => element["name"] != "");
      finishedVoting == true
          ? Navigator.of(context).pushNamed('/review_biomed')
          : Navigator.of(context).pushNamed('/biomed');
    } else if (imageId == 3) {
      final finishedVoting = context
          .read<UserProvider>()
          .gesaVotes
          .values
          .every((element) => element["name"] != "");
      finishedVoting == true
          ? Navigator.of(context).pushNamed('/review_gesa')
          : Navigator.of(context).pushNamed('/gesa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //CALLS THE FUNCTION TO DETERMINE THE APPROPRIATE SCREEN
        navigations(context);
      },

      //THE TEMPLATE FOR CREATING AVATARS WITH IMAGES
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Container(
          width: 134,
          height: 134,
          color: Colors.grey,
          child: Image.asset(imageUrl),
        ),
      ),

      //END
    );
  }
}
