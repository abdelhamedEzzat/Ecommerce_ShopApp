// ignore_for_file: unreachable_switch_case

import 'package:ecommerce_shop_app/cubits/phone_auth/phone_auth_cubit.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/screens/bottom_nav_bar_screens/favorite/favorite_screen.dart';
import 'package:ecommerce_shop_app/screens/bottom_nav_bar_screens/personal_screen/personal_screen.dart';
import 'package:ecommerce_shop_app/screens/home/home_screen.dart';
import 'package:ecommerce_shop_app/screens/login_screen/login_screen.dart';
import 'package:ecommerce_shop_app/screens/login_screen/otp_screen.dart';
import 'package:ecommerce_shop_app/screens/main_%20home_view/home_view.dart';
import 'package:ecommerce_shop_app/screens/my_card/my_card_screen.dart';
import 'package:ecommerce_shop_app/screens/payment_getway_screen/paymet_getway_screen.dart';
import 'package:ecommerce_shop_app/screens/personal_Information/personal_information.dart';
import 'package:ecommerce_shop_app/screens/product_detilis/product_details_screen.dart';
import 'package:ecommerce_shop_app/screens/see_All_screens/see_all_screen_for_hot_sales.dart';
import 'package:flutter/material.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
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
      // case MultiLoginPage.routeName:
      //   return MuiltiLoginPage.route();
      case MyCard.routeName:
        return MyCard.route(settings.arguments! as ProductInfoModel);
      case ProductDetails.routeName:
        return ProductDetails.route(settings.arguments! as ProductInfoModel);
      case SeeAllScreen.routeName:
        return SeeAllScreen.route();
      case PersonalScreen.routeName:
        return PersonalScreen.route();
      case PaymentGetwayScreen.routeName:
        return PaymentGetwayScreen.route(
            // settings.arguments! as ProductInfoModel
            );
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
