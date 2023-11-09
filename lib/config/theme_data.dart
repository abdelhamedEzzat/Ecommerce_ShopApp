import 'package:ecommerce_shop_app/my_old_divison/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../my_old_divison/recorses/text_style_manger.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xfff6f6f6),
    colorScheme: const ColorScheme(
      // for brightness
      brightness: Brightness.light,

      // for appbar background color and widget color in it
      primary: Color(0xff022238),
      onPrimary: Color(0xFFFFFFFF),

      // for promo back ground color  and button color
      surface: Color(0xff843667),

      // for Text Color
      onPrimaryContainer: Color(0xff8D969F),
      primaryContainer: Color(0xff843667),
      onSurface: Colors.black,
      secondary: Color(0xff20ACFD),
      onSecondary: Color(0xffFBF3E8),
      onSecondaryContainer: Color(0xffFFDCBC),

      // backGroundColor in card
      background: Color(0xff20ACFD),
      onBackground: Color(0xffE8F6FB),

      // error text  color
      error: Colors.red,
      onError: Color(0xFFF46258),
    ),
    //
    //  font theme
    //
    fontFamily: "Poppins",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
      bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}

///
//////
/////
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
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
          // titleMedium: getLightStyle(
          //     color: ColorMangers.yellowgold, fontSize: FontSize.s12.spMin),
          // //
          // bodySmall: getLightStyle(
          //     fontSize: FontSize.s12.spMin, color: ColorMangers.semiGray),
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
