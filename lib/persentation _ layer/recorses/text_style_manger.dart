import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';

TextStyle _textStyleManger(
    FontWeight fontWeight, double fontsize, Color color) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontWeight: fontWeight,
      fontSize: fontsize,
      color: color);
}

getSemiBoldStyle({required double fontSize, required Color color}) {
  return _textStyleManger(FontWightManager.semiBold, fontSize, color);
}

getRegularStyle({required double fontSize, required Color color}) {
  return _textStyleManger(FontWightManager.regular, fontSize, color);
}

getLightStyle({required double fontSize, required Color color}) {
  return _textStyleManger(FontWightManager.light, fontSize, color);
}
