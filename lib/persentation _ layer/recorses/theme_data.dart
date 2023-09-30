import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_style_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main
      primaryColor: ColorMangers.primaryColor,

//appbar

      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ColorMangers.primaryColor,
        toolbarHeight: AppSize.s60,
      ),

//text theme

      textTheme: TextTheme(
          titleLarge:
              getSemiBoldStyle(color: ColorMangers.white, fontSize: 12.spMax),
          //
          bodyLarge: getSemiBoldStyle(
              color: ColorMangers.black, fontSize: FontSize.s16.spMin),
          //
          bodyMedium: getLightStyle(
              fontSize: FontSize.s10.spMin, color: ColorMangers.semiGray),
          //
          labelLarge: getRegularStyle(
              fontSize: FontSize.s14.spMin, color: ColorMangers.semiBlue),
          //
          labelMedium: getSemiBoldStyle(
              fontSize: FontSize.s11.spMin, color: ColorMangers.black),
          //
          labelSmall: getRegularStyle(
              fontSize: FontSize.s8.spMin, color: ColorMangers.semiGray),
          //
          titleMedium: getLightStyle(
              color: ColorMangers.yellowgold, fontSize: FontSize.s12.spMin),
          //
          bodySmall: getLightStyle(
              fontSize: FontSize.s12.spMin, color: ColorMangers.semiGray),
          //
          titleSmall: getLightStyle(
              color: ColorMangers.white, fontSize: FontSize.s11.spMin),

          //

          headlineMedium: getRegularStyle(
              fontSize: FontSize.s12.spMin, color: ColorMangers.black),
          //
          headlineLarge: getRegularStyle(
              fontSize: FontSize.s14.spMin, color: ColorMangers.white),
          headlineSmall: getSemiBoldStyle(
              fontSize: 20.spMin, color: ColorMangers.buttonColor)));
}

//        textTheme:
//       headlineLarge: getSemiBoldStyle(
//           color: ColorManager.darkGrey, fontSize: FontSize.s16),
//       headlineMedium: getRegularStyle(
//           color: ColorManager.darkGrey, fontSize: FontSize.s14),
//       titleMedium:
//           getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
//       bodyLarge: getRegularStyle(color: ColorManager.grey1),
//       bodySmall: getRegularStyle(color: ColorManager.grey)),

//   // input decoration theme (text form field)
//   inputDecorationTheme: InputDecorationTheme(
//       // content padding
//       contentPadding: const EdgeInsets.all(AppPadding.p8),
//       // hint style
//       hintStyle:
//           getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//       labelStyle:
//           getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//       errorStyle: getRegularStyle(color: ColorManager.error),

//       // enabled border style
//       enabledBorder: OutlineInputBorder(
//           borderSide:
//               BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

//       // focused border style
//       focusedBorder: OutlineInputBorder(
//           borderSide:
//               BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

//       // error border style
//       errorBorder: OutlineInputBorder(
//           borderSide:
//               BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//       // focused border style
//       focusedErrorBorder: OutlineInputBorder(
//           borderSide:
//               BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
//   // label style
// );
