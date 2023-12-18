// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';
import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/screens/bottom_nav_bar_screens/favorite/favorite_screen.dart';
import 'package:ecommerce_shop_app/view/screens/bottom_nav_bar_screens/location/location_screen.dart';
import 'package:ecommerce_shop_app/view/screens/home_screen/home_screen.dart';
import 'package:ecommerce_shop_app/view/screens/login_screen/login_screen.dart';
import 'package:ecommerce_shop_app/view/screens/login_screen/otp_screen.dart';
import 'package:ecommerce_shop_app/view/screens/my_card/my_card_screen.dart';
import 'package:ecommerce_shop_app/view/screens/payment_getway_screen/paymet_getway_screen.dart';
import 'package:ecommerce_shop_app/view/screens/personal_Information/personal_information.dart';
import 'package:ecommerce_shop_app/view/screens/product_detilis/product_details_screen.dart';
import 'package:ecommerce_shop_app/view/screens/see_All_screens/see_all_screen_for_hot_sales.dart';

import '../view/screens/main_ home_view/home_view.dart';

class AppRouter {
  AppRouter() {}
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case HomeView.routeName:
        return HomeView.route();
      case FavoriteScreen.routeName:
        return FavoriteScreen.route();

      case MyCard.routeName:
        return MyCard.route(settings.arguments! as ProductInfoModel);
      case ProductDetails.routeName:
        return ProductDetails.route(settings.arguments! as ProductInfoModel);
      case SeeAllScreen.routeName:
        return SeeAllScreen.route();

      case PaymentGetwayScreen.routeName:
        return PaymentGetwayScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case OtpScreen.routeName:
        return OtpScreen.route(settings.arguments);
      case PersonalInformationScreen.routeName:
        return PersonalInformationScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("error"),
              ),
            ),
        settings: const RouteSettings(name: "/error"));
  }
}
