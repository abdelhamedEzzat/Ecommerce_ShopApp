// this for ProductInfo

import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/model/category_model.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/colors_manger.dart';
import 'package:equatable/equatable.dart';

class ProductInfoModel extends Equatable {
  final String title;
  final String subTitle;
  final List<CategoryModel> categoriesType;
  final String price;
  final String? addIcon;
  final int colorProdectImage;
  final String prodectImage;
  final int? currentIndex;
  final void Function()? onTap;
  ProductInfoModel({
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
  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'subTitle': subTitle,
  //     'price': price,
  //     'prodectImage': prodectImage,
  //     'colorProdectImage': colorProdectImage,
  //     'currentIndex': currentIndex,
  //   };
  // }
  static List<ProductInfoModel> products = [
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "All")
            .toList(),
        title: "AirPods Max",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "All")
            .toList(),
        title: "AirPods Max2s",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Computers")
            .toList(),
        title: "AirPods Max3s",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Computers")
            .toList(),
        title: "AirPods Max 4",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 4s",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 5",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 5",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 5",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) => name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 5 ",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
  ];
}
