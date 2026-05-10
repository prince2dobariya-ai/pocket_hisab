import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  const CustomAppBar({super.key, required this.title, this.actions = const []});

  @override
  Size get preferredSize => Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Navigator.canPop(context)
          ? null
          : Image.asset(
              "assets/logo.webp",
              width: 40,
              height: 40,
              fit: .contain,
            ),
      title: Text(title),
      centerTitle: Navigator.canPop(context) ? true : false,
      actions: actions,
    );
  }
}
