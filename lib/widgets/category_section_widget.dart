import 'package:flutter/material.dart';

import '../my_old_divison/recorses/font_manger.dart';

Widget categorySection(context,
    {required String sectionName, required String seeAll}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / AppSize.s18,
            right: MediaQuery.of(context).size.width / AppSize.s18,
            bottom: MediaQuery.of(context).size.height / AppSize.s70,
            // top: MediaQuery.of(context).size.height / AppSize.s100
          ),
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              sectionName,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                seeAll,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ]),
        ),
      ),
    ],
  );
}
