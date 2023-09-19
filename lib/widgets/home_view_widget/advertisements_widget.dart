import 'package:flutter/material.dart';

import '../../persentation _ layer/model/models.dart';
import '../../persentation _ layer/recorses/colors_manger.dart';

Widget advertisementsUi(BuildContext context, AdvertisementModel adModel) {
  return Container(
    decoration: BoxDecoration(
        color: ColorMangers.buttonColor,
        borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(right: 20, left: 20, bottom: 11, top: 21),
    padding: const EdgeInsets.only(left: 30, right: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 180,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                adModel.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(adModel.subTiltle,
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(
                height: 7,
              ),
              Text(adModel.bottomTitle,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
            height: 144,
            padding: const EdgeInsets.only(top: 6),
            child: adModel.adImage)
      ],
    ),
  );
}
