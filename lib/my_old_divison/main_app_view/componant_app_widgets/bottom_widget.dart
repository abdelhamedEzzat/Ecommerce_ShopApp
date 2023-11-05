import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../recorses/colors_manger.dart';

Widget bottomWidget(
    {context,
    required String nameOfBottom,
    required void Function()? onPress}) {
  return Container(
    decoration: BoxDecoration(
        color: ColorMangers.buttonColor,
        borderRadius: BorderRadius.circular(15)),
    height: 55.h,
    width: MediaQuery.of(context).size.width,
    // padding: EdgeInsets.symmetric(horizontal: 38.w),

    child: MaterialButton(
        onPressed: onPress,
        child: Center(
          child: Text(
            nameOfBottom,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        )),
  );
}
