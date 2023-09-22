import 'package:ecommerce_shop_app/persentation%20_%20layer/model/models.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget prodectInfoWidget(BuildContext context, ProductInfo productInfo) {
  return SizedBox(
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(),
            color: ColorMangers.white,
            child: Column(
              children: [
                //
                imageInfo(context, productInfo),
                titleinfo(context, productInfo),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s120,
                ),
                subTilteinfo(context, productInfo),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s120,
                ),
                //

                pressAndaddIcon(context, productInfo),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

//
//
Widget imageInfo(BuildContext context, ProductInfo productInfo) {
  return Expanded(
    flex: 9,
    child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          top: AppSize.s4.h,
          left: AppSize.s4.w,
          right: AppSize.s4.h,
          bottom: AppSize.s10.w),
      color: ColorMangers.colorprodect,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Image.asset(productInfo.prodectImage),
      ),
    ),
  );
}

Widget titleinfo(BuildContext context, ProductInfo productInfo) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / AppSize.s25),
      alignment: Alignment.topLeft,
      child: Text(
        style: Theme.of(context).textTheme.labelMedium,
        productInfo.title,
      ),
    ),
  );
}

Widget subTilteinfo(BuildContext context, ProductInfo productInfo) {
  return Expanded(
    child: Container(
      height: AppSize.s14.h,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / AppSize.s23),
      child: Text(
        productInfo.subTitle,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    ),
  );
}

Widget pressAndaddIcon(BuildContext context, ProductInfo productInfo) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / AppSize.s25),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / AppSize.s30,
              right: MediaQuery.of(context).size.width / AppSize.s33),
          child: Text(
            productInfo.price,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
      IconButton(onPressed: () {}, icon: Image.asset(productInfo.addIcon))
    ],
  );
}
