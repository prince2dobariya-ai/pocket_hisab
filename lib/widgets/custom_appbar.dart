import 'package:flutter/material.dart';
import 'package:pocket_hisab/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorPrimary,
      title: Text(title, style: TextStyle(color: Colors.white)),
      centerTitle: true,
    );
  }
}
