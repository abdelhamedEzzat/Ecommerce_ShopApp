//this part for animation
import 'package:flutter/material.dart';

import '../views/home_ view/componant/ad_list.dart';

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
