import 'package:ecommerce_shop_app/persentation%20_%20layer/model/models.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/componant/prodect_info_list.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/prodect_detilis_view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
// This is List View Builder And prodectInfoWidget for Hot Salaes
//

listViewBuilderOFProdectInfoForHotSales() {
  return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisExtent: 270),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return prodectInfoWidgetForHotSales(
            context, productInfoLISTForHotSales[index], press: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductDetails(prodects: productInfoLISTForHotSales[index]),
          ));
        });
      });
}

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
          "\$199.99",
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
// This is List View Builder And prodectInfoWidget for Featured Products
//

listViewBuilderForFeaturedProducts() {
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 270,
      ),
      shrinkWrap: true,
      itemCount: productInfoLISTForFeaturedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return prodectInfoWidgetForFeaturedProducts(
            context, productInfoLISTForFeaturedProducts[index]);
      });
}

Widget prodectInfoWidgetForFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Container(
      height: 200.h,
      color: ColorMangers.white,
      // color: Colors.blueAccent,
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

Widget imageInfoforFeaturedProducts(
    BuildContext context, ProductInfoModel productInfo) {
  return Expanded(
    flex: 2,
    child: Container(
      color: ColorMangers.semiPink,
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
          "\$199.99",
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
