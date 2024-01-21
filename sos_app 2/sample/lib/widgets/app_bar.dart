import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData iconType;
  final VoidCallback onPressed;

  const MyAppBar({super.key, required this.iconType, required this.onPressed});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Life Guard",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      toolbarHeight: 80.0,
      backgroundColor: const Color(0xFFFF4545),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      leading: Container(
        margin:
        const EdgeInsets.only(left: 16.0), // Set the left and right margin
        child: IconButton(
            icon: Icon(
              iconType,
              color: Colors.black,
              size: 25, // Set the icon color to black
            ),
            onPressed: onPressed),
      ),
    );
  }
}
