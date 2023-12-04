import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = "LocationScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
