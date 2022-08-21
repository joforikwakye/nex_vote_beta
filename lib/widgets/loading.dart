import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.yellow,
          size: 50.0,
        ),
      ),
    );
  }
}
