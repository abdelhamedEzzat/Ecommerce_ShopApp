import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../recorses/colors_manger.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.nameOfBottom,
    this.onPress,
  });
  final String nameOfBottom;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          )),
    );
  }
}
