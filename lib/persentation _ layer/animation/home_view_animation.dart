//this part for animation
import 'package:ecommerce_shop_app/widgets/home_view_widget/list_ad.dart';
import 'package:flutter/material.dart';

int durationSecond20 = 20;

animateFromMinToMax(double direction, double max, double min, Curve curve,
    int second, ScrollController scrollController) {
  return scrollController
      .animateTo(
    direction * adList.length,
    duration: Duration(seconds: second),
    curve: curve,
  )
      .then((value) {
    direction = direction == min ? max : min;
    animateFromMinToMax(direction, max, min, curve, second, scrollController);
  });
}
