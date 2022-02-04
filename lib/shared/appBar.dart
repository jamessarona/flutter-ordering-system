import 'package:efood/shared/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconButton leading;
  final IconButton action;
  final String title;

  MyAppBar({
    this.leading,
    this.action,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: customColors[30],
      leading: leading,
      title: Text(
        title,
        style: robotoTitle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            color: Colors.blue[100]),
      ),
      actions: [action],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
