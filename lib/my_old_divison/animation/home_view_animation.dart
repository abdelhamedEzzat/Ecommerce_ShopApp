//this part for animation
import 'package:ecommerce_shop_app/model/promo_model.dart';
import 'package:flutter/material.dart';

int durationSecond20 = 20;

animateFromMinToMax(double direction, double max, double min, Curve curve,
    int second, ScrollController scrollController) {
  return scrollController
      .animateTo(
    direction * PromoModel.promos.length,
    duration: Duration(seconds: second),
    curve: curve,
  )
      .then((value) {
    direction = direction == min ? max : min;
    animateFromMinToMax(direction, max, min, curve, second, scrollController);
  });
}
