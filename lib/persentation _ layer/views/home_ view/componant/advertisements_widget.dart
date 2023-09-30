import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/models.dart';
import '../../../recorses/colors_manger.dart';
import 'ad_list.dart';

listViewAdvertisementsWidget(BuildContext context) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      mainAxisExtent: MediaQuery.of(context).size.width,
    ),
    // physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: adList.length,
    itemBuilder: (BuildContext context, int index) {
      return adWidgetMobile(context, adList[index]);
    },
  );
}

Widget adWidgetMobile(
    BuildContext context, AdvertisementModel advertisementModel) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  return Container(
    //  width: 300.w,
    width: mediaQuery.size.width / 1.1,
    height: mediaQuery.size.height / 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorMangers.buttonColor,
    ),
    margin: EdgeInsets.only(
      left: mediaQuery.size.width / AppSize.s20,
      right: mediaQuery.size.width / AppSize.s20,
      top: mediaQuery.size.height / AppSize.s45,
    ),

    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(
                top: AppSize.s7.h, bottom: AppSize.s5.h, left: AppSize.s35.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    advertisementModel.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // const SizedBox(
                  //   height: SizeWidget.s5,
                  // ),
                  Text(
                      maxLines: 2,
                      advertisementModel.subTiltle,
                      style: Theme.of(context).textTheme.titleSmall),
                  // const SizedBox(
                  //   height: SizeWidget.s5,
                  // ),
                  Text(advertisementModel.bottomTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          )),
      Expanded(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: advertisementModel.adImage,
      ))
    ]),
  );
}
