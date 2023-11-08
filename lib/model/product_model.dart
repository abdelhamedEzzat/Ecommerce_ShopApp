// ignore_for_file: public_member_api_docs, sort_constructors_first
// this for ProductInfo

import 'package:equatable/equatable.dart';

import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/model/category_model.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/colors_manger.dart';

class ProductInfoModel extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final List<CategoryModel> categoriesType;
  final List<ProductInfoModel>? hotSales;
  final String price;
  final String? addIcon;
  final int colorProdectImage;
  final String prodectImage;
  final int? currentIndex;
  final void Function()? onTap;
  int clickCount = 4;

  ProductInfoModel({
    this.hotSales,
    required this.id,
    required this.categoriesType,
    required this.title,
    required this.subTitle,
    required this.price,
    this.addIcon,
    required this.colorProdectImage,
    required this.prodectImage,
    this.currentIndex,
    this.onTap,
  });

  @override
  List<Object?> get props => [
        title,
        subTitle,
        price,
        addIcon,
        colorProdectImage,
        prodectImage,
        currentIndex
      ];

  static List<ProductInfoModel> products = [
    ProductInfoModel(
        id: 1,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Mobile")
            .toList(),
        title: " iPad Pro",
        subTitle: "Space Gray (6th gen)",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.mobileImage),
    //
    ProductInfoModel(
        id: 2,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Computers")
            .toList(),
        title: "Magic Wireless",
        subTitle: "iPad Pro 12.9-Inch",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.computer),
    //
    ProductInfoModel(
        id: 3,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Mobile")
            .toList(),
        title: "Apple iPad Pro",
        subTitle: "Space Gray (6th gen)",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.mobileImage),
    //
    ProductInfoModel(
        id: 4,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 5s",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.headPhoneImage),
    //
    ProductInfoModel(
        id: 5,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Computers")
            .toList(),
        title: "Magic Wireless",
        subTitle: "iPad Pro 12.9-Inch",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.computer),
    //
    ProductInfoModel(
        id: 6,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 5",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.headPhoneImage),
    //
    ProductInfoModel(
        id: 7,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 6",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    //
    ProductInfoModel(
        id: 8,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 5",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.headPhoneImage),
    //
    ProductInfoModel(
        id: 9,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 6",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    //
    ProductInfoModel(
        id: 10,
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 6 ",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
  ];
}
