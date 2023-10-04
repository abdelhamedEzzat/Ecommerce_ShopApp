import 'package:ecommerce_shop_app/cubit/home_view_cubit.dart';
import 'package:flutter/material.dart';

import '../../../model/models.dart';
import '../../../recorses/colors_manger.dart';
import '../../../recorses/images_manger.dart';
import '../../prodect_detilis_view/product_details.dart';
import 'prodect_info_widget.dart';

//
//
//

List<ProductInfoModel> productInfoLISTForHotSales = [
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 2,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.semiPink).value,
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 2.99,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.semiPink).value,
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 3.99,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.colorMobileProduct).value,
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 4.99,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.colorMobileProduct).value,
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 5.99,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.colorMobileProduct).value,
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 6.99,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.colorMobileProduct).value,
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 7.99,
      title: "AirPods Max",
      colorProdectImage: const Color(ColorMangers.colorMobileProduct).value,
      subTitle: "Winning Beats sound",
      prodectImage: AssetsImages.headPhoneImage),
  ProductInfoModel(
      addIcon: AssetsImages.addIcon,
      price: 8.99,
      title: "AirPods Max",
      subTitle: "Winning Beats sound",
      colorProdectImage: const Color(ColorMangers.colorMobileProduct).value,
      prodectImage: AssetsImages.headPhoneImage),
];

//
//      List View . bUILDER For hot sales
//

listViewBuilderOFProdectInfoForHotSales() {
//
  final HotSalesList = productInfoLISTForHotSales;
  //

  return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisExtent: 270),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return prodectInfoWidgetForHotSales(
          context,
          ProductInfoModel(
              title: HotSalesList[index].title,
              subTitle: HotSalesList[index].subTitle,
              price: HotSalesList[index].price,
              addIcon: HotSalesList[index].addIcon,
              colorProdectImage: HotSalesList[index].colorProdectImage,
              prodectImage: HotSalesList[index].prodectImage),

          //
          // Navigation
          //
          press: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                  prodects: ProductInfoModel(
                      title: HotSalesList[index].title,
                      subTitle: HotSalesList[index].subTitle,
                      price: HotSalesList[index].price,
                      addIcon: HotSalesList[index].addIcon,
                      colorProdectImage: HotSalesList[index].colorProdectImage,
                      prodectImage:
                          productInfoLISTForHotSales[index].prodectImage)),
            ));
          },

          //
          //
        );
      });
}

//
// This is List View Builder And prodectInfoWidget for Featured Products
//

listViewBuilderForFeaturedProducts() {
  //
  final featuredProductsList = productInfoLISTForHotSales;
  //
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 270,
      ),
      shrinkWrap: true,
      itemCount: productInfoLISTForHotSales.length - 2,
      itemBuilder: (BuildContext context, int index) {
        return prodectInfoWidgetForFeaturedProducts(
            context,
            ProductInfoModel(
                title: featuredProductsList[index + 2].title,
                subTitle: featuredProductsList[index + 2].subTitle,
                price: featuredProductsList[index + 2].price,
                addIcon: featuredProductsList[index + 2].addIcon,
                colorProdectImage:
                    featuredProductsList[index + 2].colorProdectImage,
                prodectImage: featuredProductsList[index + 2].prodectImage));
      });
}

// //
// //
// //

// List<ProductInfoModel> productInfoLISTForFeaturedProducts = [
//   ProductInfoModel(
//       addIcon: AssetsImages.addIcon,
//       price: "\$199.99",
//       title: "AirPods Max",
//       subTitle: "Winning Beats sound",
//       colorProdectImage: ColorMangers.black,
//       prodectImage: AssetsImages.headPhoneImage),
//   ProductInfoModel(
//       addIcon: AssetsImages.addIcon,
//       price: "\$199.99",
//       title: "AirPods Max",
//       subTitle: "Winning Beats sound",
//       colorProdectImage: ColorMangers.black,
//       prodectImage: AssetsImages.headPhoneImage),
//   ProductInfoModel(
//       addIcon: AssetsImages.addIcon,
//       price: "\$199.99",
//       title: "AirPods Max",
//       subTitle: "Winning Beats sound",
//       colorProdectImage: ColorMangers.black,
//       prodectImage: AssetsImages.headPhoneImage),
//   ProductInfoModel(
//       addIcon: AssetsImages.addIcon,
//       price: "\$199.99",
//       title: "AirPods Max",
//       subTitle: "Winning Beats sound",
//       colorProdectImage: ColorMangers.black,
//       prodectImage: AssetsImages.headPhoneImage),
//   ProductInfoModel(
//       addIcon: AssetsImages.addIcon,
//       price: "\$199.99",
//       title: "AirPods Max",
//       colorProdectImage: ColorMangers.black,
//       subTitle: "Winning Beats sound",
//       prodectImage: AssetsImages.headPhoneImage),
//   ProductInfoModel(
//       addIcon: AssetsImages.addIcon,
//       price: "\$199.99",
//       title: "AirPods Max",
//       subTitle: "Winning Beats sound",
//       colorProdectImage: ColorMangers.black,
//       prodectImage: AssetsImages.headPhoneImage),
// ];

// FeaturedProducts   HotSales
// List productInfoLISTForHotSales = [
//   {
//     "HotSales": "HotSales",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$10",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.semiPink,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "HotSales": "HotSales",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$2",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.black,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "FeaturedProducts": "FeaturedProducts",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$3",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.semiPink,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "FeaturedProducts": "FeaturedProducts",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$4",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.primaryColor,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "FeaturedProducts": "FeaturedProducts",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$5",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.semiPink,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "FeaturedProducts": "FeaturedProducts",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$6",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.semiPink,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "FeaturedProducts": "FeaturedProducts",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$7",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.semiPink,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
//   {
//     "FeaturedProducts": "FeaturedProducts",
//     "addIcon": AssetsImages.addIcon,
//     "price": "\$8",
//     "title": "AirPods Max",
//     "subTitle": "Winning Beats sound",
//     "colorProdectImage": ColorMangers.semiPink,
//     "prodectImage": AssetsImages.headPhoneImage
//   },
// ];

//
//  List View . bUILDER For hot sales
//
