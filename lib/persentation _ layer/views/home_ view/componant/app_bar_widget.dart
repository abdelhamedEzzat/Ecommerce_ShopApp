import 'package:flutter/material.dart';

AppBar appBarWidget(Widget title, [icon]) {
  return AppBar(
    elevation: 0,
    leading: icon,
    title: title,
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
