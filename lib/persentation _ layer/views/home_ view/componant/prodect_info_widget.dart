import 'package:ecommerce_shop_app/persentation%20_%20layer/model/models.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
//  Widget function  for HotSalesProducts
//
//
Widget prodectInfoWidgetForHotSales(
    BuildContext context, ProductInfoModel productInfo,
    {required void Function()? press}) {
  return GestureDetector(
    onTap: press,
    child: Container(
        margin: const EdgeInsets.only(),
        color: ColorMangers.white,
        // color: Colors.blueAccent,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imageInfoForHotSales(context, productInfo),
              Expanded(
                child: GestureDetector(
                  onTap: productInfo.onTap,
                  child: Column(
                    children: [
                      titleinfoForHotSales(context, productInfo),
                      subTilteinfoForHotSales(context, productInfo),
                      priceAndaddIconForHotSales(context, productInfo),
                    ],
                  ),
                ),
              ),
            ])),
  );
}

//  Widget function  for imageHotSalesProducts
//

Widget imageInfoForHotSales(
    BuildContext context, ProductInfoModel productInfo) {
  return Expanded(
    flex: 2,
    child: Container(
      color: productInfo.colorProdectImage,
      margin: EdgeInsets.only(
          top: AppSize.s4.h,
          left: AppSize.s4.w,
          right: AppSize.s4.h,
          bottom: AppSize.s8.h),
      width: MediaQuery.of(context).size.width,
      child: Center(child: Image.asset(productInfo.prodectImage)),
    ),
  );
}

//
//  Widget function  for titleHotSalesProducts
//

Widget titleinfoForHotSales(
    BuildContext context, ProductInfoModel productInfo) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    height: AppSize.s14.h,
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(
      left: MediaQuery.of(context).size.width / AppSize.s23,
    ),
    child: Text(
      productInfo.title,
      style: Theme.of(context).textTheme.labelMedium,
    ),
  );
}

//
//  Widget function  for subtitleHotSalesProducts
//

Widget subTilteinfoForHotSales(
    BuildContext context, ProductInfoModel productInfo) {
  return Container(
    height: AppSize.s15.h,
    alignment: Alignment.topLeft,
    padding:
        EdgeInsets.only(left: MediaQuery.of(context).size.width / AppSize.s23),
    child: Text(
      productInfo.subTitle,
      style: Theme.of(context).textTheme.labelSmall,
    ),
  );
}

//
//  Widget function  for priceAndaddHotSalesProducts
//

Widget priceAndaddIconForHotSales(
    BuildContext context, ProductInfoModel productInfo) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / AppSize.s25),
        margin: EdgeInsets.only(
            bottom: 20.h,
            right: MediaQuery.of(context).size.width / AppSize.s12),
        child: Text(
          productInfo.price,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      Expanded(
        child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AssetsImages.addIcon,
            )),
      ),
    ],
  );
}

//
//
//  Widget function  for FeaturedProducts
//
//

Widget prodectInfoWidgetForFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Container(
      height: 200.h,
      color: ColorMangers.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            imageInfoforFeaturedProducts(context, productInfo),
            Expanded(
              child: Column(
                children: [
                  titleInfoforFeaturedProducts(context, productInfo),
                  subTilteInfoForFeaturedProducts(context, productInfo),
                  priceAndAddIconForFeaturedProducts(context, productInfo),
                ],
              ),
            ),
          ]));
}

//
//  Widget function  for  image FeaturedProducts
//

Widget imageInfoforFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Expanded(
    flex: 2,
    child: Container(
      color: productInfo.colorProdectImage,
      margin: EdgeInsets.only(
          top: AppSize.s4.h,
          left: AppSize.s4.w,
          right: AppSize.s4.h,
          bottom: AppSize.s8.h),
      width: MediaQuery.of(context).size.width,
      child: Center(child: Image.asset(productInfo.prodectImage)),
    ),
  );
}

//
//  Widget function  for  title FeaturedProducts
//

Widget titleInfoforFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    height: AppSize.s15.h,
    alignment: Alignment.topLeft,
    padding:
        EdgeInsets.only(left: MediaQuery.of(context).size.width / AppSize.s23),
    child: Text(
      productInfo.title,
      style: Theme.of(context).textTheme.labelMedium,
    ),
  );
}

//
//  Widget function  for  subTitle FeaturedProducts
//

Widget subTilteInfoForFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Container(
    height: AppSize.s15.h,
    alignment: Alignment.topLeft,
    padding:
        EdgeInsets.only(left: MediaQuery.of(context).size.width / AppSize.s23),
    child: Text(
      productInfo.subTitle,
      style: Theme.of(context).textTheme.labelSmall,
    ),
  );
}

//
//  Widget function  for  priceAndAddIcon FeaturedProducts
//

Widget priceAndAddIconForFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / AppSize.s25),
        margin: EdgeInsets.only(
            bottom: 20.h,
            right: MediaQuery.of(context).size.width / AppSize.s12),
        child: Text(
          productInfo.price,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      Expanded(
        child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AssetsImages.addIcon,
            )),
      ),
    ],
  );
}
