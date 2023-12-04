// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_shop_app/widgets/bottom_navigation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_shop_app/config/colors_manger.dart';

import '../../cubits/bottomNavigationBar_cubit/bottom_navigation_bar_cubit.dart';

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
            // If on the first page of the other screens Navigator, pop it
            if (!otherScreensNavigatorKey.currentState!.canPop()) {
              // Navigate to the home screen in the bottom navigation bar
              cubit.changeIndex(0);
              return true;
            }
            otherScreensNavigatorKey.currentState!.pop();
            return false;
          },
          child: Scaffold(
              backgroundColor: ColorMangers.backGroundColor,
              // drawer: const DrawerClass(),
              bottomNavigationBar:
                  bottomNavigationBar(cubit, context, otherScreensNavigatorKey),
              body: BlocBuilder<BottomNavigationBarCubit,
                  BottomNavigationBarState>(
                builder: (context, state) {
                  return novigator(otherScreensNavigatorKey);
                },
              )),
        );
      },
    );
  }
}
