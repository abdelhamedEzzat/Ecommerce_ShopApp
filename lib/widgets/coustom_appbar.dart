// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/cubits/bottomNavigationBar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? icon;
  final int onBackButtonPressed = 0;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      title: title,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      actions: [
        if (icon != null) // Check if icon is not null before adding it
          Center(
            child: IconButton(
              onPressed: () {},
              icon: icon!,
            ),
          ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  @override
  Size get preferredSize => const Size.fromHeight(56);

  onpressed(context) {
    BlocProvider.of<BottomNavigationBarCubit>(context).pages[0];
  }
}
