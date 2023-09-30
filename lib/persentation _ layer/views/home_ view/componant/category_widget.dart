import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_list.dart';
import '../../../model/models.dart';
import '../../../recorses/colors_manger.dart';
import '../../../recorses/font_manger.dart';

listViewcategoryWidget() {
  return ListView.builder(
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      //  physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return categoryWidget(context, categoryList[index]);
      });
}

Widget categoryWidget(BuildContext context, CategoryModel cotegory) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  return GestureDetector(
      onTap: cotegory.onTap,
      child: Container(
          padding: EdgeInsets.only(
            left: mediaQuery.size.width / AppSize.s25,
            right: mediaQuery.size.width / AppSize.s25,
            top: mediaQuery.padding.top / AppSize.s10,
            bottom: mediaQuery.padding.bottom / AppSize.s10,
          ),
          margin: EdgeInsets.only(
            right: 12.w,
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                cotegory.iconImage,
                color: ColorMangers.semiGray,
                width: SizeWidget.s5.w,
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
          )));
}
