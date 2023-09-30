import 'package:flutter/material.dart';

AppBar appBarWidget({required Widget title}) {
  return AppBar(
    elevation: 0,
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
