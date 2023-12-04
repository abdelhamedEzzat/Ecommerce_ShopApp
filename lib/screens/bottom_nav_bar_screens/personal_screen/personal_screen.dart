import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  static const String routeName = "PersonalScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const PersonalScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
