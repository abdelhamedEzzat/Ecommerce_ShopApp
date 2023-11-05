// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shop_app/model/promo_model.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/font_manger.dart';

class PromoListView extends StatelessWidget {
  const PromoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: MediaQuery.of(context).size.width,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: PromoModel.promos.length,
      itemBuilder: (BuildContext context, int index) {
        return _PromoCard(
          promo: PromoModel.promos[index],
        );
      },
    );
  }
}

class _PromoCard extends StatelessWidget {
  final PromoModel promo;
  const _PromoCard({
    Key? key,
    required this.promo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width / 1.1,
      height: mediaQuery.size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      margin: EdgeInsets.only(
        left: mediaQuery.size.width / 20.w,
        right: mediaQuery.size.width / 20.w,
        top: mediaQuery.size.height / 45.h,
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
                    //
                    // text for promo title
                    //
                    Text(
                      promo.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),

                      //
                      //  text for promo subTitle
                      //
                    ),
                    Text(
                        maxLines: 2,
                        promo.subTiltle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary)),
                    //
                    //  text for promo BottomTitle
                    //
                    Text(promo.bottomTitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer)),
                  ],
                ),
              ),
            )),

        //
        //this container for promo Image
        //
        Expanded(
          child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: promo.adImage,
              )),
        )
      ]),
    );
  }
}
