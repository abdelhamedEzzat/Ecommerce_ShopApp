import 'package:ecommerce_shop_app/view/screens/bottom_nav_bar_screens/favorite/favorite_screen.dart';

import 'package:ecommerce_shop_app/view/screens/home_screen/home_screen.dart';
import 'package:ecommerce_shop_app/view/screens/bottom_nav_bar_screens/location/location_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  int currentIndex = 0;

  List<String> pages = const [
    HomeScreen.routeName,
    FavoriteScreen.routeName,
    LocationScreen.routeName,
  ];

  changeIndex(
    int index,
  ) {
    currentIndex = index;

    emit(ChangeScreensForBar(index: currentIndex));
  }
}
