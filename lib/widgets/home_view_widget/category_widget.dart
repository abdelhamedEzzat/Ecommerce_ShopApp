import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../persentation _ layer/model/models.dart';
import '../../persentation _ layer/recorses/colors_manger.dart';
import '../../persentation _ layer/recorses/font_manger.dart';

Widget categoryWidget(BuildContext context, CategoryModel cotegory) {
  return GestureDetector(
    onTap: cotegory.onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / AppSize.s25,
              right: MediaQuery.of(context).size.width / AppSize.s25,
              top: MediaQuery.of(context).padding.top / AppSize.s4,
              bottom: MediaQuery.of(context).padding.bottom / AppSize.s4,
            ),
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / AppSize.s40,
            ),
            decoration: BoxDecoration(
                color: ColorMangers.white,
                border: Border.all(
                  color: ColorMangers.gray,
                ),
                borderRadius: BorderRadius.circular(
                  14,
                )),
            child: Row(
              children: [
                Image.asset(
                  cotegory.iconImage,
                  color: ColorMangers.semiGray,
                  width: SizeWidget.s7.sp,
                ),
                SizedBox(
                  width: SizeWidget.s4.sp,
                ),
                Center(
                  child: Text(
                    cotegory.categoryName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            )),
      ],
    ),
  );
}
