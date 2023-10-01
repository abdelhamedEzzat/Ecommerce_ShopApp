// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/componant/app_bar_widget.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/home_view_mobile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../persentation _ layer/recorses/font_manger.dart';
import '../../persentation _ layer/recorses/images_manger.dart';
import '../../persentation _ layer/views/home_ view/Home_views_desktop.dart';
import '../../persentation _ layer/views/home_ view/componant/drawer_widget.dart';

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
        appBar: appBarWidget(
          Image.asset(
            AssetsImages.logoImage,
            height: SizeWidget.s24.h,
            width: SizeWidget.s104.w,
          ),
        ),
        drawer: const DrawerClass(),
        body: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            print(constraints.maxWidth.toInt());
            if (constraints.maxWidth.toInt() <= 600) {
              return const HomeViewMobile();
            } else {
              return const homeViewDesktop();
            }
          },
        ));
  }
}
