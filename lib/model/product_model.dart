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

  const ProductInfoModel({
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
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Mobile")
            .toList(),
        title: "Apple iPad Pro",
        subTitle: "Space Gray (6th gen)",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.mobileImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Mobile")
            .toList(),
        title: "Apple iPad Pro",
        subTitle: "Space Gray (6th gen)",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.mobileImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Computers")
            .toList(),
        title: "Magic Wireless",
        subTitle: "iPad Pro 12.9-Inch",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.computer),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Computers")
            .toList(),
        title: "Magic Wireless",
        subTitle: "iPad Pro 12.9-Inch",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.computer),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 5s",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.headPhoneImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Headsets")
            .toList(),
        title: "AirPods Max 5",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.headPhoneImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 6",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
        categoriesType: CategoryModel.categories
            .where((name) =>
                name.categoryName == "All" || name.categoryName == "Speakers")
            .toList(),
        title: "AirPods Max 6",
        subTitle: "Winning Beats sound",
        price: "199",
        colorProdectImage: ColorMangers.semiPink,
        prodectImage: AssetsImages.appStoreImage),
    ProductInfoModel(
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
