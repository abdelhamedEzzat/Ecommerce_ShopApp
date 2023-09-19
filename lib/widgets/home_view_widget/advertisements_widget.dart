import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';

import '../../persentation _ layer/model/models.dart';
import '../../persentation _ layer/recorses/colors_manger.dart';

Widget advertisementsUi(BuildContext context, AdvertisementModel adModel) {
  return
      //for container dicoration
      //
      Container(
    decoration: BoxDecoration(
        color: ColorMangers.buttonColor,
        borderRadius: BorderRadius.circular(AppSize.s10)),
    margin: const EdgeInsets.only(
        right: AppSize.s20,
        left: AppSize.s20,
        bottom: AppSize.s11,
        top: AppSize.s21),
    padding: const EdgeInsets.only(left: AppSize.s30, right: AppSize.s18),

    //For Title  and subtitle and bottom title and image
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: SizeWidget.s180,
          padding: const EdgeInsets.only(top: AppSize.s20, bottom: AppSize.s20),
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
        const SizedBox(
          width: SizeWidget.s15,
        ),
        Container(
            height: SizeWidget.s144,
            padding: const EdgeInsets.only(top: 6),
            child: adModel.adImage)
      ],
    ),
  );
}
