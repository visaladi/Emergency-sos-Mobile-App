import 'package:flutter/material.dart';

class MyAppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarDefault({super.key});

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
      automaticallyImplyLeading:
      false, // Set this to false to remove the back arrow
    );
  }
}
