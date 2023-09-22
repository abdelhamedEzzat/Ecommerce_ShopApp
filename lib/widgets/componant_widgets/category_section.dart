import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';

Widget categorySection(context,
    {required String sectionName, required String seeAll}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / AppSize.s18,
              right: MediaQuery.of(context).size.width / AppSize.s18,
              bottom: MediaQuery.of(context).size.height / AppSize.s45),
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              sectionName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                seeAll,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ]),
        ),
      ),
    ],
  );
}
