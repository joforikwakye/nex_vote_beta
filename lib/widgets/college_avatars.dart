import 'package:flutter/material.dart';
import 'package:nex_vote_beta/models/get_presidents.dart';

class CollegeAvatars extends StatelessWidget {
  final String imageUrl;
  final int imageId;

  // ignore: use_key_in_widget_constructors
  const CollegeAvatars(this.imageUrl, this.imageId);

/*THIS FUNCTION DETERMINES THE IMAGEID BEING PASSED TO THE CONSTRUCTOR AND 
NAVIGATES TO THE APPROPRIATE SCREEN */
  void navigations(BuildContext context) async {
    if (imageId == 1) {
      // GetPresidents getPresidents = GetPresidents();
      // var result = await getPresidents.getPresidents();
      // // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/aces');
    } else if (imageId == 2) {
      Navigator.of(context).pushNamed('/biomed');
    } else if (imageId == 3) {
      Navigator.of(context).pushNamed('/gesa');
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
