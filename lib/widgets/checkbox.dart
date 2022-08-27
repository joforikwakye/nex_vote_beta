import 'package:flutter/material.dart';

class Checkobx extends StatefulWidget {
  const Checkobx({Key key}) : super(key: key);

  @override
  State<Checkobx> createState() => _CheckobxState();
}

class _CheckobxState extends State<Checkobx> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (value) => {setState(() {})},
    );
  }
}
