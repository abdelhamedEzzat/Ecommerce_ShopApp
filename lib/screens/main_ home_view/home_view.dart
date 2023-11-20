// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_shop_app/screens/home/home_screen.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shop_app/config/colors_manger.dart';

import '../../config/images_manger.dart';
import '../../widgets/custom_drawer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorMangers.backGroundColor,
      appBar: CustomAppBar(
        title: Center(
          child:
              Image.asset(AssetsImages.logoImage, height: 24.h, width: 104.w),
        ),
      ),
      drawer: const DrawerClass(),
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          print(constraints.maxWidth.toInt());
          if (constraints.maxWidth.toInt() <= 600) {
            return const HomeScreen();
          }
          return Container();
          // else {
          //   return const homeViewDesktop();
          // }
        },
      ),
    );
  }
}
