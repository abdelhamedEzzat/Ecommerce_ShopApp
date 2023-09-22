import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../persentation _ layer/model/models.dart';
import '../../persentation _ layer/recorses/colors_manger.dart';

Widget advertisementsUi(
  BuildContext context,
  AdvertisementModel adModel,
) {
  return
      //for container dicoration
      //

      Container(
    decoration: BoxDecoration(
        color: ColorMangers.buttonColor,
        borderRadius: BorderRadius.circular(AppSize.s10)),
    margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width / AppSize.s19,
        left: MediaQuery.of(context).size.width / AppSize.s19,
        bottom: MediaQuery.of(context).size.height / AppSize.s45,
        top: MediaQuery.of(context).size.height / AppSize.s45),
    padding: const EdgeInsets.only(left: AppSize.s30, right: AppSize.s18),

    //For Title  and subtitle and bottom title and image
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: SizeWidget.s165.w,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / AppSize.s35,
            bottom: MediaQuery.of(context).size.height / AppSize.s35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                adModel.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SizeWidget.s7,
              ),
              Text(adModel.subTiltle,
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(
                height: SizeWidget.s7,
              ),
              Text(adModel.bottomTitle,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / SizeWidget.s22,
        ),
        Container(
            height: SizeWidget.s144.sp,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 70),
            child: adModel.adImage)
      ],
    ),
  );
}
