import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), centerTitle: true);
  }
}
