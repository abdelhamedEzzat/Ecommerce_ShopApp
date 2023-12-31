import 'package:ecommerce_shop_app/config/app_router.dart';
import 'package:ecommerce_shop_app/controller/cubits/bottomNavigationBar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_shop_app/view/screens/bottom_nav_bar_screens/favorite/favorite_screen.dart';
import 'package:ecommerce_shop_app/view/screens/bottom_nav_bar_screens/location/location_screen.dart';
import 'package:flutter/material.dart';

// this Widget for  Navigation control

Navigator novigatorBarHelper(
    GlobalKey<NavigatorState> otherScreensNavigatorKey) {
  return Navigator(
//
//this key is used to navigate to screens other than those
//directly associated with the bottom navigation bar.
//

    key: otherScreensNavigatorKey,
    //
    //The onGenerateRoute callback handles
    //the route generation for these screens.
    //
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case FavoriteScreen.routeName:
          return FavoriteScreen.route();
        case LocationScreen.routeName:
          return LocationScreen.route();

        default:
          return AppRouter.onGeneratedRoute(settings);
      }
    },
  );
}

// this Widget for control to ui for bottom navigation bar  and on tap on it

Widget bottomNavigationBar(BottomNavigationBarCubit cubit, BuildContext context,
    GlobalKey<NavigatorState> otherScreensNavigatorKey) {
  return Container(
    //
    //   Decorition of BottomNavigationBar
    //
    margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
    decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20)]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,

        // items of BNB
        //

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Location"),
        ],

        // Action When pressed on Bottom Navigation Bar

        onTap: (int index) {
          cubit.changeIndex(index);
          otherScreensNavigatorKey.currentState!
              .pushReplacementNamed(cubit.pages[index].toString());
        },
      ),
    ),
  );
}
