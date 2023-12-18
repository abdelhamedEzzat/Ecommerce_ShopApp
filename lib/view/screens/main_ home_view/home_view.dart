// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_shop_app/controller/cubits/bottomNavigationBar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_shop_app/view/widgets/novigator_bar_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_shop_app/config/colors_manger.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "HomeView";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeView(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarCubit cubit =
        BlocProvider.of<BottomNavigationBarCubit>(context);
    final GlobalKey<NavigatorState> otherScreensNavigatorKey =
        GlobalKey<NavigatorState>();

    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            //
            //  this  for check if otherScreensNavigatorKey is in a screen that didnt have a back  return or not
            //if NO the return will be the home screen

            if (!otherScreensNavigatorKey.currentState!.canPop()) {
              cubit.changeIndex(0);
              return true;
              //
              //else the return Will be any screen in Pages List
            } else {
              otherScreensNavigatorKey.currentState!.pop();
              int currentindex = cubit.pages.indexOf(
                  otherScreensNavigatorKey.currentState!.widget.initialRoute!);
              cubit.changeIndex(currentindex);

              return false;
            }
          },
          child: Scaffold(
              backgroundColor: ColorMangers.backGroundColor,
              //
              //the bottomNavigatorBar is on all screens in appLication

              bottomNavigationBar:
                  bottomNavigationBar(cubit, context, otherScreensNavigatorKey),
              body: BlocBuilder<BottomNavigationBarCubit,
                  BottomNavigationBarState>(
                builder: (context, state) {
                  //
                  //this Navigation Bar helper  To design the shape of the navigation bar

                  return novigatorBarHelper(otherScreensNavigatorKey);
                },
              )),
        );
      },
    );
  }
}
