import 'package:ecommerce_shop_app/persentation%20_%20layer/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: Image.asset(
          "assets/images/logoo.png",
          height: 24,
          width: 104,
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
