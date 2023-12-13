import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
          title: Text("fasfasd"),
          icon: Icon(
            Icons.abc,
          )),
    );
  }
}
