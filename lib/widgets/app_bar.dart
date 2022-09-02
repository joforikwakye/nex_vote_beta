import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  // ignore: use_key_in_widget_constructors
  const CustomAppBar(this.text);

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
  Size get preferredSize => throw UnimplementedError();
}
