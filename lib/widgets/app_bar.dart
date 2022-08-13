import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  CustomAppBar(this.text);

  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      backgroundColor: const Color(0xff610B0C),
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
