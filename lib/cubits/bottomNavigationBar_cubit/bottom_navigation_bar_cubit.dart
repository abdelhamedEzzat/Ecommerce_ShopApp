import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/screens/bottom_nav_bar_screens/favorite/favorite_screen.dart';
import 'package:ecommerce_shop_app/screens/bottom_nav_bar_screens/personal_screen/personal_screen.dart';
import 'package:ecommerce_shop_app/screens/home/home_screen.dart';
import 'package:ecommerce_shop_app/screens/bottom_nav_bar_screens/location/location_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  int currentIndex = 0;
  var prd = ProductInfoModel;

  List<Widget> pages = const [
    HomeScreen(),
    FavoriteScreen(),
    LocationScreen(),
    PersonalScreen()
  ];

  changeIndex(
    int index,
  ) {
    currentIndex = index;

    emit(ChangeScreensForBar(index: currentIndex));
  }
//  changeItems(final GlobalKey<NavigatorState> navigatorKey;
//   final String tapItems;){
//  if (tapItems == "Home") {
//       child = const HomeScreen();
//     } else if (tapItems == "Favorite") {
//       child = const FavoriteScreen();
//     } else if (tapItems == "Location") {
//       child = const LocationScreen();
//     } else {
//       child = HomeScreen();
//     }

//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(builder: (context) => child);
//       },
//     );
//   }
}
