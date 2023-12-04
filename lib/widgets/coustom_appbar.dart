// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      title: title,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      actions: [
        Center(
          child: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/bag.png"),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
