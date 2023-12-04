import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = "FavoriteScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FavoriteScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
